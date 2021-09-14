# Find Ratioed Tweets

Small utility written in Go to find the most [ratioed](https://www.esquire.com/news-politics/news/a54440/twitter-ratio-reply/) tweets, given a search.

## Limitations

The Twitter API endpoint used apparently won't give you results older than a week or so.

## Requirements

* Go 1.17
* Docker (for the Postgres database)

## Instructions

1. Set up a Twitter developer account and a new application. You should get a bearer token.
2. Create an `.env` file and add the token. The file should have one line and look like this:

   ```
   TWITTER_BEARER_TOKEN=...
   ```

3. Run `$ docker-compose up -d` to start the Postgres database server.
4. Using any Postgres client, execute the queries from `schema.sql`. This will create the table structure. Here is the connection string:

   ```
   host=localhost port=54329 user=postgres password=postgres dbname=postgres sslmode=disable
   ```

5. Run `$ make run QUERY="search terms (from:username)"`.
   This will search until there are no more results and store everything in the database.

6. Run SQL queries to get useful data. The following will get tweets sorted by their "ratio" for the given hashtag:

   ```SQL
   SELECT text, ratio
   FROM tweets
   WHERE query = 'search terms (from:username)'
       AND likes > 10
   ORDER BY ratio DESC;
   ```