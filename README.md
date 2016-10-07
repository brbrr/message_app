Test assignemnt to kottans.org Ruby course.
Web application which creates a text self-destructing messages.

Build using Hanami framework and Postgres.

Task:

1. generate a safe link to saved message
2. User should be able to choose destruction option:
 - destroy message after the first link visit
 - destroy after 1 hour
3. Message texts should be stored encrypted using AES algorithm
4. Cover applicaiton with unit and integration tests
5. Deploy applicaiton to Heroku

Bonus points for implementing:

1. Encrypt messages on frontend with user password. Show it obly if typed passowrd is correct
2. self-destruction of messages after given number of link visits or after given number of hours
