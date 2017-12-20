CREATE TABLE "user"
(
  id        SERIAL NOT NULL
    CONSTRAINT user_pkey
    PRIMARY KEY,
  login     VARCHAR(30),
  password  VARCHAR(30),
  name      VARCHAR(30),
  email     VARCHAR(30),
  birthday  DATE,
  city      VARCHAR(30),
  registred DATE,
  photo     TEXT
);
CREATE TABLE tag
(
  id  SERIAL NOT NULL
    CONSTRAINT tag_pkey
    PRIMARY KEY,
  tag VARCHAR(30)
);
CREATE TABLE style
(
  id    SERIAL NOT NULL
    CONSTRAINT style_pkey
    PRIMARY KEY,
  style VARCHAR(30)
);
CREATE TABLE resources
(
  id          SERIAL NOT NULL
    CONSTRAINT resources_pkey
    PRIMARY KEY,
  link        VARCHAR(100),
  description TEXT
);
CREATE TABLE type
(
  id      SERIAL NOT NULL
    CONSTRAINT type_pkey
    PRIMARY KEY,
  "_type" VARCHAR(100)
);
-- auto-generated definition
CREATE TABLE fav_food
(
  user_id INTEGER
    CONSTRAINT fav_food_user_id_fkey
    REFERENCES "user",
  tag_id  INTEGER
    CONSTRAINT fav_food_tag_id_fkey
    REFERENCES tag
);
-- auto-generated definition
CREATE TABLE photo
(
  id      SERIAL NOT NULL
    CONSTRAINT photo_pkey
    PRIMARY KEY,
  photo   VARCHAR(100),
  "_date" DATE
);
-- auto-generated definition
CREATE TABLE comment
(
  id      SERIAL NOT NULL
    CONSTRAINT comment_pkey
    PRIMARY KEY,
  "_text" TEXT,
  "_date" DATE
);
-- auto-generated definition
CREATE TABLE post
(
  id      SERIAL NOT NULL
    CONSTRAINT post_pkey
    PRIMARY KEY,
  "_text" TEXT,
  "_date" DATE,
  likes   INTEGER
);
-- auto-generated definition
CREATE TABLE post_comment
(
  post_id    INTEGER
    CONSTRAINT post_comment_post_id_fkey
    REFERENCES post,
  comment_id INTEGER
    CONSTRAINT post_comment_comment_id_fkey
    REFERENCES comment
);
-- auto-generated definition
CREATE TABLE post_photo
(
  post_id  INTEGER
    CONSTRAINT post_photo_post_id_fkey
    REFERENCES post,
  photo_id INTEGER
    CONSTRAINT post_photo_photo_id_fkey
    REFERENCES photo
);
-- auto-generated definition
CREATE TABLE post_style
(
  post_id  INTEGER
    CONSTRAINT post_style_post_id_fkey
    REFERENCES post,
  style_id INTEGER
    CONSTRAINT post_style_style_id_fkey
    REFERENCES style
);
-- auto-generated definition
CREATE TABLE post_tags
(
  post_id INTEGER
    CONSTRAINT post_tags_post_id_fkey
    REFERENCES post,
  tag_id  INTEGER
    CONSTRAINT post_tags_tag_id_fkey
    REFERENCES tag
);-- auto-generated definition
CREATE TABLE res_type
(
  res_id  INTEGER
    CONSTRAINT res_type_res_id_fkey
    REFERENCES resources,
  type_id INTEGER
    CONSTRAINT res_type_type_id_fkey
    REFERENCES type
);

-- auto-generated definition

-- auto-generated definition
CREATE TABLE status
(
  id     INTEGER
    CONSTRAINT status_id_fkey
    REFERENCES "user",
  status BOOLEAN NOT NULL
);
-- auto-generated definition

-- auto-generated definition

-- auto-generated definition

-- auto-generated definition

-- auto-generated definition
CREATE TABLE user_comment
(
  user_id    INTEGER
    CONSTRAINT user_comment_user_id_fkey
    REFERENCES "user",
  comment_id INTEGER
    CONSTRAINT user_comment_comment_id_fkey
    REFERENCES comment
);
-- auto-generated definition
CREATE TABLE user_photo
(
  user_id  INTEGER
    CONSTRAINT user_photo_user_id_fkey
    REFERENCES "user",
  photo_id INTEGER
    CONSTRAINT user_photo_photo_id_fkey
    REFERENCES photo
);


-- auto-generated definition
CREATE TABLE user_posts
(
  user_id INTEGER
    CONSTRAINT user_posts_user_id_fkey
    REFERENCES "user",
  post_id INTEGER
    CONSTRAINT user_posts_post_id_fkey
    REFERENCES post
);