import sqlite3, string, random


def random_string(string_length, special=False):
    letters = string.ascii_letters
    numbers = '0123456789'
    specials = '!£$%&*;:@~#<>,./?'
    combo = numbers + letters + specials if special else numbers + letters
    return ''.join(random.choice(combo) for i in range(string_length))


conn = sqlite3.connect('data.db')
c = conn.cursor()

c.execute('''
    CREATE TABLE hyperlinks (
        uid TEXT UNIQUE PRIMARY KEY NOT NULL,
        link TEXT NOT NULL
    )
''')

c.execute('''
    CREATE TABLE locations (
        uid TEXT UNIQUE PRIMARY KEY NOT NULL,
        path TEXT NOT NULL,
        name TEXT NOT NULL,
        location_order INTEGER NOT NULL,
        location_type TEXT NOT NULL
    )
''')

c.execute('''
    CREATE TABLE location_types (
        uid TEXT UNIQUE PRIMARY KEY NOT NULL,
        name TEXT NOT NULL
    )
''')

c.execute('''
    CREATE TABLE recent (
        uid TEXT UNIQUE PRIMARY KEY NOT NULL,
        path TEXT NOT NULL,
        date_time DATE NOT NULL
    )
''')

c.execute('''
    CREATE TABLE notes (
        uid TEXT UNIQUE PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        date_time DATE NOT NULL
    )
''')

c.execute('INSERT INTO location_types (uid, name) VALUES (?, "folder")', (random_string(20), ))
c.execute('INSERT INTO location_types (uid, name) VALUES (?, "file")', (random_string(20), ))
c.execute('INSERT INTO location_types (uid, name) VALUES (?, "link")', (random_string(20), ))

c.execute('INSERT INTO locations (uid, path, name, location_order, location_type) VALUES (?, "/root", "root", 1, "folder")', (random_string(20), ))
c.execute('INSERT INTO locations (uid, path, name, location_order, location_type) VALUES (?, "/links", "links", 2, "link")', (random_string(20), ))
c.execute('INSERT INTO locations (uid, path, name, location_order, location_type) VALUES (?, "/notes", "notes", 3, "file")', (random_string(20), ))

conn.commit()
c.close()