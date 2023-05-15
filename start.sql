CREATE TABLE IF NOT EXISTS"users"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE
);
DROP TABLE users;

INSERT INTO users (name, email) VALUES ('Kate', 'kate_p@gmail.com');
INSERT INTO users (name, email) VALUES ('Alice', 'alice_wonderland@gmail.com');
INSERT INTO users (name, email) VALUES ('Hermione', 'hermione_g@gmail.com');
INSERT INTO users (name, email) VALUES ('Harry', 'harry_p@gmail.com');
INSERT INTO users (name, email) VALUES ('Ron', 'ron_w@gmail.com');
INSERT INTO users (name, email) VALUES ('Jinny', 'jinny_w@gmail.com');
UPDATE users
SET name = 'Ginny', email= 'ginny_w@gmail.com'
WHERE id = 5;

SELECT * FROM users;

CREATE TABLE IF NOT EXISTS "articles"(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text TEXT,
    author_id INTEGER REFERENCES "users" (id) 
);

INSERT INTO articles (title, text, author_id) VALUES ('JavaScript', 'Something about js', 5);
INSERT INTO articles (title, text, author_id) VALUES ('Java', 'Something about Java', 6);
INSERT INTO articles (title, text, author_id) VALUES ('TypeScript', 'Something about ts', 1);
INSERT INTO articles (title, text, author_id) VALUES ('Python', 'Something about Python', 2);
INSERT INTO articles (title, text, author_id) VALUES ('C++', 'Something about C++', 4);
INSERT INTO articles (title, text, author_id) VALUES ('C#', 'Something about C#', 3);
INSERT INTO articles (title, text, author_id) VALUES ('C', 'Something about C', 2);
INSERT INTO articles (title, text, author_id) VALUES ('PHP', 'Something about PHP', 4);
INSERT INTO articles (title, text, author_id) VALUES ('SQL', 'Something about SQL', 1);

SELECT * FROM articles;

SELECT users.name, articles.title
FROM users
INNER JOIN articles ON users.id = articles.author_id;

SELECT users.name, articles.title, articles.text
FROM users
LEFT JOIN articles ON users.id = articles.author_id
ORDER BY users.name;

SELECT users.name, articles.title, articles.text
FROM articles
RIGHT JOIN users ON users.id = articles.author_id
ORDER BY articles.title;

SELECT users.name, articles.title, articles.text
FROM articles
FULL OUTER JOIN users ON users.id = articles.author_id
ORDER BY users.name DESC;

SELECT users.name, articles.title
FROM users, articles
WHERE users.id = articles.author_id;

CREATE TABLE IF NOT EXISTS "comments"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    comment TEXT,
    article_id INTEGER REFERENCES "articles" (id),
    user_id INTEGER REFERENCES "users" (id),
    created_at TIMESTAMP NOT NULL
);

INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment1', 'Good article', 4, 1, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment2', 'Nice article', 9, 6, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment3', 'Interesting article', 1, 3, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment4', 'Awsome article', 4, 5, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment5', 'Perfect article', 7, 4, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment6', 'Brilliant article', 4, 4, NOW());
INSERT INTO comments (name, comment, article_id, user_id, created_at) 
VALUES ('Comment7', 'Super', 5, 3, NOW());

DELETE FROM comments WHERE id=6 OR id=7 OR id=8;

SELECT * FROM comments;

SELECT comments.name, comments.comment, users.name, users.email
FROM articles, comments, users
WHERE articles.id=4 AND comments.article_id=articles.id AND users.id=comments.user_id;