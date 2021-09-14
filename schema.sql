CREATE TABLE tweets
(
	id              varchar   NOT NULL PRIMARY KEY,
	text            varchar   NOT NULL,
	author_id       varchar   NOT NULL,
	conversation_id varchar,
	created_at      timestamp NOT NULL,
	query           varchar   NOT NULL,
	likes           int       NOT NULL,
	replies         int       NOT NULL,
	retweets        int       NOT NULL,
	quotes          int       NOT NULL,
	ratio           real      NOT NULL /* "replies" divided by "likes" */
);

CREATE TABLE users
(
	id              varchar   NOT NULL PRIMARY KEY,
	username        varchar   NOT NULL,
	name            varchar   NOT NULL,
	created_at      timestamp NOT NULL,
	followers_count integer   NOT NULL,
	following_count integer   NOT NULL,
	tweet_count     integer   NOT NULL
);
