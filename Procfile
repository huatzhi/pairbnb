web: rails s

web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

worker: bundle exec sidekiq --environment development -C config/sidekiq.yml

tail: -f log/development.log