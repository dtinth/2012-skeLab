#!/bin/sh
export RAILS_ENV=production
bundle install
rake db:migrate
rake assets:precompile

