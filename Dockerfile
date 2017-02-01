FROM phusion/passenger-ruby23

MAINTAINER Hunter Long <info@socialeck.com>

# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV development
ENV PASSENGER_APP_ENV development
ENV GIT_EMAIL
ENV GIT_NAME
ENV GIT_REPO
ENV GIT_BRANCH
ENV GIT_USERNAME
ENV GIT_PERSONAL_TOKEN

CMD ["/sbin/my_init"]

RUN /pd_build/utilities.sh
RUN /pd_build/ruby-2.3.*.sh

RUN rm /etc/nginx/sites-enabled/default

ADD conf/nginx/rails-env.conf /etc/nginx/main.d/rails-env.conf
ADD conf/nginx/app.conf /etc/nginx/sites-enabled/webapp.conf

RUN mkdir /var/www/html
RUN chown -R app:app /var/www/html

WORKDIR /var/www/html

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/scripts/start.sh"]
