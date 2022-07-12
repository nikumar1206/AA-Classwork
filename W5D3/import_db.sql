-- DROP TABLE IF EXISTS question_tags;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
-- DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT
);
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT, 
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    reply_body TEXT,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    likes BOOLEAN,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Johny', 'Appleseed'),
    ('Mark', 'Zuckerber'),
    ('Bloop', 'Gloop'),
    ('Jane', 'Doe');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('help', 'I am stuck', (SELECT id FROM users WHERE fname = 'Johny'));


INSERT INTO
    question_follows (author_id, question_id)
VALUES
    ((SELECT author_id FROM questions WHERE title = 'help'), (SELECT id FROM questions WHERE title = 'help'));


INSERT INTO
    replies (question_id, parent_reply_id, reply_body, user_id)
   
VALUES
    ((SELECT id FROM questions WHERE title = 'help'),(NULL) , ('hi'), (SELECT id FROM users WHERE fname = 'Johny' ));


INSERT INTO
    replies (question_id, parent_reply_id, reply_body, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'help'), (SELECT id FROM replies WHERE reply_body = 'hi') , ('bye'), (SELECT id FROM users WHERE fname = 'Mark' ));


