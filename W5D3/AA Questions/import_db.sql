/* users / questions / question_follow / replies / question_likes */

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
users (fname, lname)
VALUES 
("Aishwarya", "Nair"), ("Hal", "Parker");

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)  
);

INSERT INTO
questions(title, body, author_id)
VALUES
("Installation", "How do I install SQL?", 2),
("New question", "How do I exit this infinite loop?", 1);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
question_follows(follower_id, question_id)
VALUES
(1, (SELECT id FROM questions WHERE title = "Installation")),
(2, (SELECT id FROM questions WHERE title = "Installation")),
(1, (SELECT id FROM questions WHERE title = "New question"));

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,  
    parent_reply_id INTEGER,  
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
replies(question_id, author_id, body)
VALUES
((SELECT id FROM questions WHERE title = "New question"), 1, "You can't."),
((SELECT id FROM questions WHERE title = "New question"), 2, "Go back to the beginning!");

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    liker_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (liker_id) REFERENCES users(id)
);

INSERT INTO
question_likes (question_id, liker_id)
VALUES
((SELECT id FROM questions WHERE title = "Installation"), 1),
((SELECT id FROM questions WHERE title = "New question"), 2);


