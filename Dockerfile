MAINTAINER Hunter Long <info@soaicleck.com>

FROM phusion/passenger-ruby23

# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV development
ENV PASSENGER_APP_ENV development


# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN /pd_build/utilities.sh

RUN /pd_build/ruby-2.3.*.sh

RUN rm /etc/nginx/sites-enabled/default
ADD conf/nginx/app.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp


RUN rm -f /etc/service/nginx/down


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
