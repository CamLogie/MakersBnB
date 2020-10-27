require 'pg'

class User

  attr_reader :name, :user_name

  def initialize(name:, user_name:)
    @name = name
    @user_name = user_name
  end

  #Wraps user info into User object. Will be used with a Database
  def self.add(name:, user_name:)
    User.new(name: name, user_name: user_name)
  end

  def self.find?(user_name)
    database_connection
    db_user_name = @@connection.exec("SELECT user_name FROM users WHERE user_name = '#{user_name}';" )
    db_user_name[0]['user_name'] == user_name
  end

  # 
  def self.database_connection 
    if ENV['ENVIRONMENT'] = 'test'
      @@connection = PG.connect :dbname => 'makers_bnb_manager_test'
    else
      @@connection = PG.connect :dbname => 'makers_bnb_manager'
    end
  end

end