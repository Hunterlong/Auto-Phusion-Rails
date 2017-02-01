#!/bin/bash

# Disable Strict Host checking for non interactive git clones

mkdir -p -m 0700 /root/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

if [ ! -z "$SSH_KEY" ]; then
  echo $SSH_KEY > /root/.ssh/id_rsa.base64
  base64 -d /root/.ssh/id_rsa.base64 > /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
fi

# Setup git variables
if [ ! -z "$GIT_EMAIL" ]; then
  git config --global user.email "$GIT_EMAIL"
fi
if [ ! -z "$GIT_NAME" ]; then
  git config --global user.name "$GIT_NAME"
  git config --global push.default simple
fi

# Dont pull code down if the .git folder exists
if [ ! -d "/var/www/html/.git" ]; then
  # Pull down code from git for our site!
  if [ ! -z "$GIT_REPO" ]; then
    # Remove the test index file
    rm -Rf /var/www/html/*
    if [ ! -z "$GIT_BRANCH" ]; then
      if [ -z "$GIT_USERNAME" ] && [ -z "$GIT_PERSONAL_TOKEN" ]; then
        git clone -b $GIT_BRANCH $GIT_REPO /var/www/html/ || exit 1
      else
        git clone -b ${GIT_BRANCH} https://${GIT_USERNAME}:${GIT_PERSONAL_TOKEN}@${GIT_REPO} /var/www/html || exit 1
      fi
    else
      if [ -z "$GIT_USERNAME" ] && [ -z "$GIT_PERSONAL_TOKEN" ]; then
        git clone $GIT_REPO /var/www/html/  || exit 1
      else
        git clone https://${GIT_USERNAME}:${GIT_PERSONAL_TOKEN}@${GIT_REPO} /var/www/html || exit 1
      fi
    fi
    chown -Rf app.app /var/www/html
  fi
fi

cd /var/www/html
bundle install

rm -f /etc/service/nginx/down
