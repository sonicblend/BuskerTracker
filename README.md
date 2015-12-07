# Busker Tracker

Track street performances as they happen outside Storm Consultancy headquarters in Bath.

This is my first Ruby on Rails application, feedback is welcome.

## Overview

- Each busker has a profile with photo and contact links
- Performance details are recorded as they happen

## Dev environment setup

* Install [rvm](https://rvm.io/), [pow](http://pow.cx/), [direnv](https://github.com/direnv/direnv)
* Clone this repository
* Sign up for a free [cloudinary](http://cloudinary.com/) account. Create a .powenv.local file in the base directory using the below template, and include your account details:
```bash
export CLOUDINARY_NAME=
export CLOUDINARY_API_KEY=
export CLOUDINARY_API_SECRET=
```
* ```cd ../; cd -``` RVM should install the required ruby version (as specified in .ruby-version)
* Run ```bundle install```
* Change out of the repository directory and back in. If the setup has gone to plan, pow should automatically serve the website at: http://busker-tracker.dev/
