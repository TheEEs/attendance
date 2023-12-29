# Attendance.rb

> This is a hobby project that I thought about when I had to count lazily and tiredly hundreds of people in a conference to report to my boss. It would be great if they can scan a QR code on the hall's screen to notify us that they had been there.

## Installation

You need `Docker` and `Docker Compose` installed on your computer, and some ways to expose your app to the Internet so users can access to it.

#### Running in production
Firstly, let's modify variables in `.env.production` to fit your needs. Here we have:

* MAILTRAP_API_KEY: API key used to send email via Mailtrap.
* APP_DOMAIN: The domain that Clearance uses to determine host of password reset link.
* RAILS_SERVE_STATIC_FILES: Tells rails app to serve static assets otherwise you have to launch an addition service to serve static assets in `/app/public` directory.

After making sure everything is ready, in your terminal:
```bash
$ docker-compose -f docker-compose.prod.yml up -d
```

#### Running in development
In your terminal:
```bash
$ docker-compose -f docker-compose.dev.yml up -d
$ docker-compose -f docker-compose.dev.yml exec web /bin/sh
```
Then navigate to `/app` directory, run `bundle install` and you are good to go.