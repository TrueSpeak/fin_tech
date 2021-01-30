# Fin_tech application
### Environment server

Ruby 2.7.0
Rails 6.1.0
bundler 2.2.3

## Preparation of the workplace
#### Install git
````bash
sudo apt install git
````
## Clone project in your workspace
````bash
git clone https://github.com/TrueSpeak/fin_tech.git
````

## Install Ruby
Install by rvm (recommended)
````bash
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm


rvm install 2.7.0
rvm use 2.7.0 --default
ruby -v
````
Install by rbenv
````bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.7.0
rbenv global 2.7.0
ruby -v
````

### Install bundler

```bash
gem install bundler
```

### Install Rails

```bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 6.1.0
rails -v
```

### Install postgresql 12

Update system packages
```bash
sudo apt update
sudo apt -y install vim bash-completion wget
sudo apt -y upgrade
```
Then need to reboot
After reboot need to import GPG key and add PostgreSQL 12 repository into Ubuntu Machine
And install PostgreSQL 12 server and client packages

```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list

sudo apt update
sudo apt -y install postgresql-12 postgresql-client-12
psql --version

### Configuration and start project
All actions do in root folder of project

bin/rails db:create
bin/rails db:migrate
bin/rails s
```

### Testing by rspec
All actions do in root folder of project

```bash
RAILS_ENV=test bin/rails db:create
RAILS_ENV=test bin/rails db:migrate
bundle exec rspec spec
```

### Start project in first time
Need to copy *database.yml.example* and rename to *database.yml* for
normal work of database before run

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails s
```