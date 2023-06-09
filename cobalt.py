from astatine import Astatine, AstatineJSON, AstatineAES, AstatineSMTP
from bottle import template, request, abort, redirect
from datetime import datetime
import os, filetype, shutil


class Cobalt(object):

    def __init__(self):
        self.aj = AstatineJSON('data.json')

        self.server_settings = self.aj.read()['server_settings']
        self.user_roles = self.aj.read()['user_roles']

        debug = self.server_settings['debug']
        reload = self.server_settings['reload']
        port = self.server_settings['port']
        host = self.server_settings['host']
        quiet = self.server_settings['quiet']
        server = self.server_settings['server']
        sql = 'data.db'

        self.astatine = Astatine(host, port, debug, reload, server, quiet, sql)

        self.astatine.enable_sessions()
        self.create_routes()

        # self.astatine.create_function_sql('decrypt', 1, self.aes.decrypt)

    def create_routes(self):
        self.astatine.route('/', 'get', self.index, True)
        self.astatine.route('/links', 'get', self.links, True)
        self.astatine.route('/notes', 'get', self.notes, True)
        self.astatine.route('/notes/<uid>', 'get', self.notes, True)
        self.astatine.route('/root', 'get', self.root, True)
        self.astatine.route('/root/<path:path>', 'get', self.root, True)
        self.astatine.route('/create/folder/<path:path>', 'post', self.create_folder, True)
        self.astatine.route('/create/location', 'post', self.create_location, True)
        self.astatine.route('/create/hyperlink', 'post', self.create_hyperlink, True)

        self.astatine.error([404, 403], self.errors)

    def get_size_type(self, size):
        true_size = None
        if size >= 1024 * 1024 * 1024 * 1204:
            true_size = '{}tb'.format(round(size / (1024 * 1024 * 1024 * 1204), 1))
        elif size >= 1024 * 1024 * 1024:
            true_size = '{}gb'.format(round(size / (1024 * 1024 * 1024), 1))
        elif size >= 1024 * 1024:
            true_size = '{}mb'.format(round(size / (1024 * 1024), 1))
        else:
            true_size = '{}kb'.format(round(size / 1024, 1))
        return true_size if true_size != '0.0kb' else '0kb'

    def errors(self, code):
        return template('html/error.tpl', code=code)

    def index(self, session):
        pass

    def links(self, session):
        links = self.astatine.execute_sql('SELECT * FROM hyperlinks')
        locations = self.astatine.execute_sql('SELECT * FROM locations ORDER BY location_order ASC')
        location_types = self.astatine.execute_sql('SELECT * FROM location_types')
        total, used, free = shutil.disk_usage("/")
        si = [total, used, free]
        return template('html/links.tpl', session=session, links=links, locations=locations, location_types=location_types, path='/links/', si=si)

    def notes(self, session, uid=None):
        notes = self.astatine.execute_sql('SELECT * FROM notes ORDER BY date_time DESC')
        note_content = None
        locations = self.astatine.execute_sql('SELECT * FROM locations ORDER BY location_order ASC')
        location_types = self.astatine.execute_sql('SELECT * FROM location_types')
        total, used, free = shutil.disk_usage("/")
        si = [total, used, free]
        if uid:
            note_content = self.astatine.execute_sql('SELECT * FROM notes WHERE uid = ?', (uid,))
        return template('html/notes.tpl', session=session, notes=notes, locations=locations, location_types=location_types, path='/notes/', si=si, note_content=note_content)

    def root(self, session, path=None):
        total, used, free = shutil.disk_usage("/")
        si = [total, used, free]

        dirs, files = [], []
        file_content, image_content, video_content = None, None, None
        is_image, is_file, is_video = False, False, False
        cwd = os.path.join(os.getcwd() + '/user_data/', path or '')

        try:
            nav_path = 'root/' + path
        except TypeError:
            nav_path = 'root/'

        if path and path[0] == '/':
            abort(404)

        try:
            if os.path.isdir(cwd):
                for f in os.scandir(cwd):
                    tdir = [f.name, datetime.fromtimestamp(os.path.getmtime(f.path)).strftime('%d-%m-%Y %H:%M'),
                            None if f.is_dir() else self.get_size_type(
                                os.path.getsize('./user_data/{}'.format(path or '')))]
                    if f.is_dir():
                        dirs.append(tdir)
                    else:
                        files.append(tdir)
            elif os.path.isfile(cwd):
                if filetype.is_image(cwd):
                    image_content, is_image = cwd, True
                elif filetype.is_video(cwd):
                    video_content, is_video = cwd, True
                else:
                    with open('user_data/' + path, 'r') as f:
                        file_content = f.read()
                    is_file = True
            else:
                abort(404)
        except FileNotFoundError:
            abort(404)

        locations = self.astatine.execute_sql('SELECT * FROM locations ORDER BY location_order ASC')
        location_types = self.astatine.execute_sql('SELECT * FROM location_types')

        if not is_image and not is_file and not is_video:
            return template('html/index.tpl', session=session, dirs=dirs, files=files, path=path, nav_path=nav_path, locations=locations, location_types=location_types, si=si)
        else:
            return template('html/file.tpl', session=session, file_content=file_content, image_content=image_content, video_content=video_content, is_video=is_video, is_file=is_file, is_image=is_image, path=path, nav_path=nav_path, locations=locations, location_types=location_types, si=si)

    def create_folder(self, session, path):
        folder_name = request.forms.get('name')
        os.mkdir('user_data/' + path + '/' + folder_name)
        redirect(path)

    def create_location(self, session):
        url = request.forms.get('url')
        name = request.forms.get('name')
        location_type = request.forms.get('location-type')
        next_order = self.astatine.execute_sql('SELECT location_order FROM locations ORDER BY location_order DESC LIMIT 1')
        if next_order:
            for n in next_order:
                next_order = n[0] + 1
        else:
            next_order = 1
        self.astatine.execute_sql('INSERT INTO locations (uid, path, name, location_order, location_type) VALUES (?,?,?,?,?)', (self.astatine.generate_uid('locations', 'uid'), url, name, next_order, location_type))

    def create_hyperlink(self, session):
        url = request.forms.get('url')
        self.astatine.execute_sql('INSERT INTO hyperlinks (uid, link) VALUES (?,?)', (self.astatine.generate_uid('locations', 'uid'), url))
        redirect('/links')


if __name__ == '__main__':
    webapp = Cobalt()
    webapp.astatine.run_astatine()

