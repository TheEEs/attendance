# Attendance.rb

> This is a hobby project that I thought about when I had to count lazily and tiredly hundreds of people in a conference to report to my boss. It would be great if they can scan a QR code on the hall's screen to notify us that they had been there.

## Installation

You need `Docker` and `Docker Compose` installed on your computer, and some way to expose your app to the Internet so users can access to it.

#### Running in production
Firstly, let's modify parameters in `.env.production` to fit your needs. Here's we have:

* MAILTRAP_API_KEY: API key used to send email via Mailtrap.
* APP_DOMAIN: The domain that Clearance uses to determine host of password reset link.
* RAILS_SERVE_STATIC_FILES: Tells rails app to serve static assets otherwise you should include an addition container for serving static assets in `/app/public` directory.

After making sure everything is OK, in your terminal, type:
```bash
$ docker-compose -f docker-compose.prod.yml up -d
```

#### Running in development
In your terminal, type:
```bash
$ docker-compose -f docker-compose.dev.yml up -d
$ docker-compose -f docker-compose.dev.yml exec web /bin/sh
```
Then navigate to `/app` directory, run `bundle install` and you are good to go.