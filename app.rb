require 'sinatra'
require 'mysql2'

get '/test' do
  'Hi'

  db_config = {
    host: '127.0.0.1', username: 'root', database: 'app'
  }

  client = Mysql2::Client.new(db_config)
  client.query("INSERT INTO users (name) VALUES ('Test name')")
  results = client.query('SELECT * FROM users')

  content_type :json
  results.to_a.to_json
end
