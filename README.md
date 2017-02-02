# Auto-Phusion-Rails [![Build Status](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails.svg?branch=master)](https://travis-ci.org/Hunterlong/Auto-Phusion-Rails)
Automatically pull your Ruby on Rails source and run it on Nginx and Passenger.


### Public Github Repo
Pulls a rails application, bundle install -> db:migrate -> nginx
```bash
docker run -d -p 80:80 -e 'GIT_REPO=railsapps/learn-rails' hunterlong/auto-phusion-rails
```

### Private Git Repo
If you don't have a personal token yet, get it from Github. https://github.com/blog/1509-personal-api-tokens
```bash
docker run -d -p 80:80 \
  -e 'GIT_PERSONAL_TOKEN=tok3ng0eshere' \
  -e 'GIT_EMAIL=info@github.com' \
  -e 'GIT_USERNAME=githubUsername' \
  -e 'GIT_BRANCH=master' \
  -e 'GIT_REPO=RailsApps/learn-rails' \
 hunterlong/auto-phusion-rails
```

### Customize Nginx From Repo
You can also have your nginx configs come from the github repo you are pulling from. In the rails 'config' folder, add a file 'nginx.conf'. If your repo has this file, it will be inserted into the Nginx Server.

### Customize Nginx From conf File
You can mount a customized nginx config to your rails application. If you don't need any custom nginx configs, the file *conf/nginx/app.conf* is automatically loaded as default.
```bash
docker run -d -p 80:80 -v /configs/mynginx.conf:/etc/nginx/sites-enabled/webapp.conf \
 -e 'GIT_REPO=RailsApps/learn-rails' hunterlong/auto-phusion-rails
```

### Speed Up Gem Installations
Mount your local gem installation folder with the container's.
```bash
docker run -d -p 80:80 -v /my/local/gems:/usr/local/bundle \
 -e 'GIT_REPO=RailsApps/learn-rails' hunterlong/auto-phusion-rails
```

### Custom NginX Environment Variables In App
If you need environment variables to be passed down all the way to the Rails application, you can mount a nginx ENV config file using '-v'.  You can also host this file on your github repo at: 'config/rails_env.conf'. The docker image will automatically pull and use this file in nginx. 
###### Mounting
```bash
docker run -d -p 80:80 -v /configs/rails_env.conf:/etc/nginx/main.d/rails_env.conf \
 -e 'GIT_REPO=RailsApps/learn-rails' hunterlong/auto-phusion-rails
```
