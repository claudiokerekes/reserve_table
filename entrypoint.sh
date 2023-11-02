#!/bin/bash

# Realiza las migraciones de la base de datos
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

# Inicia el servidor Puma
#bundle exec puma -C config/puma.rb
bundle exec rails server -p 3000 -b 0.0.0.0