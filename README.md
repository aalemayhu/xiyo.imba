# XIYO

A URL storage tool written in [Imba][0]. It was supposed to be a URL shortener
but the urls are just stored in a table and whenever the url is redirected to
the visits column is incremented.

The server code in [main.imba][i] is based on the great work by Sindre
Aarsaether from [Imba Router - Serverside routing][1]

![Form](./GitHub/Form.png)
![Shortened](./GitHub/Shortened.png)

## Usage

```
$ yarn install
$ ./main.imba 
Imba v1.4.4 is already loaded.
Listening on http://localhost:8080
```

Then visit [http://localhost:8080](http://localhost:8080).

## Design

This is a very naive implementation which stores all urls in a PostgreSQL database
and uses the unique `id` as suffix. 

The Imba application is server side rendered and there are three endpoints

- `GET /:id`, redirects you the a known URL provided the `:id` is valid.
- `POST /create`, create a new URL expectes `url` in the query and redirects you 
to the front page.
- `GET /.*/`, return the front page.

## Setting up the database

```psql
CREATE USER xiyo WITH PASSWORD 'sushi-something';

CREATE DATABASE xiyo;
ALTER ROLE xiyo SET client_encoding TO 'utf8';
ALTER ROLE xiyo SET default_transaction_isolation TO 'read committed';
ALTER ROLE xiyo SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE xiyo TO xiyo;

CREATE TABLE urls(
   id serial PRIMARY KEY,
   url VARCHAR (3000) UNIQUE NOT NULL,
   created_on TIMESTAMP NOT NULL,
   visits numeric DEFAULT 0,
   UNIQUE(url)
);
```

### Adding sample data

```psql
INSERT INTO urls (url, created_on) VALUES('http://imba.io', '2019-07-19');
INSERT INTO urls (url, created_on) VALUES('http://scrimba.com', '2019-07-19');
INSERT INTO urls (url, created_on) VALUES('http://gitspeak.com', '2019-07-19');


INSERT INTO urls (url, created_on) VALUES('http://reddit.com', '2019-07-19T10:07:03.447Z');

```

[0]: https://imba.io
[1]: https://scrimba.com/p/pMvYcg/cnw7NSK
[i]: /main.imba
