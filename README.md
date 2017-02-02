# Auto-Phusion-Rails [![Build Status](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails.svg?branch=master)](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails) 
Automatically pull your Ruby on Rails source and run it on Nginx and Passenger.


#### Public Github Repo
Pulls a rails applcation, bundle install -> db:migrate -> nginx $
```bash
docker run -d -e -p 80:80 -e 'GIT_REPO=github.com/RailsApps/learn-rails' hunterlong/auto-phusion-rails
```


#### Private Git Repo
If you don't have a personal token yet, get it from Github. https://github.com/blog/1509-personal-api-tokens
```bash
docker run -d -e -p 80:80 'GIT_PERSONAL_TOKEN=tok3ng0eshere' \
  -e 'GIT_EMAIL=info@github.com' -e 'GIT_USERNAME=githubUsername' \
  -e 'GIT_BRANCH=master' \
  -e 'GIT_REPO=github.com/RailsApps/learn-rails' \
  hunterlong/auto-phusion-rails
```
