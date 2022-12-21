# Music-Forum
Credit work on the discipline "Internet programming languages" on Ruby Rails 7

<h3>Приложение использует базу данных Postgres</h3>
<p>
rails new music_forum --database=postgresql
</p>

<b>Создание базы данных</b><br>
bin/rails db:create

<h3>Aутентификация с Devise</h3>
1. gem "devise"
2. bundle install
3. rails generate devise:install
4. Добавить в config/environments/development.rb:
<i>config.action_mailer.default_url_options = { :host => 'localhost:3000' }</i>

<b>Внимание!</b><br>
<i>
Команда выполняется строго до генерации модели, иначе возникнет ошибка "NoMethodError: undefined method `devise'"
В этом случае нужно:
1. убрать строчку device_for в config/routes.rb
2. удалить модель rails destroy devise User
3. rails generate devise:install
</i>

<b>Генерация контроллера User и представления profile</b><br>
rails g controller user profile

<b>Создание модели User и миграции для связи с бд</b><br>
<p>
rails generate devise User
bundle exec rake db:migrate
</p>

<b>Создание ресурсов Review и Comment</b><br>
<p>
rails g resource review
rails g resource comment
</p>

<b>Гем для форм</b><br>
<p>
gem 'simple_form'
rails generate simple_form:install
</p?
