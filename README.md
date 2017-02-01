# Auto-Phusion-Rails [![Build Status](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails.svg?branch=master)](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails) 
Automatically git pull your Ruby on Rails application and run it on Nginx and Passenger.


#### Automatic Git Repo
```bash
docker run -d -e 'GIT_PERSONAL_TOKEN=tok3ng0eshere' \
  -e 'GIT_EMAIL=info@github.com' -e 'GIT_USERNAME=githubUsername' \
  -e 'GIT_BRANCH=master' \
  -e 'GIT_REPO=github.com/RailsApps/learn-rails' \
  hunterlong/auto-phusion-rails
```
