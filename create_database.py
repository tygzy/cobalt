import sqlite3

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

conn.commit()
c.close()