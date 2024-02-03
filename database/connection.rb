require 'active_record'
require 'dotenv'
 Dotenv.load('../.env')



db_config = {
  adapter: 'mysql2',
  database: ENV['DB_NAME'],
  host: ENV['HOST'],
  username: ENV['USER_DB'],
  password: ENV['PASSWORD'],
  port: ENV['PORT']
}


ActiveRecord::Base.establish_connection(db_config)
