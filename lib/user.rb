require 'pg'

class User

  attr_reader :name, :user_name, :id

  def initialize(name:, user_name:, id:)
    @name = name
    @user_name = user_name
    @id = id
  end

  # Wraps user info into User object. Will be used with a Database
  def self.add(name:, user_name:)
    return 'This user name is already registered!' if find?(user_name)

    result = add_user_and_return_info(name, user_name)
    User.new(id: result[0]['id'], name: result[0]['name'], user_name: result[0]['user_name'])
  end

  def self.find?(user_name)
    database_connection
    db_user_name = @@connection.exec(
      "SELECT user_name 
         FROM users 
        WHERE user_name = '#{user_name}';" 
    )
    return true unless db_user_name.none?

    false
  end

  def self.retrieve(user_name:)
    return 'This user name does not exist' unless find?(user_name)

    result = find_user_and_return_info(user_name)
    User.new(id: result[0]['id'], name: result[0]['name'], user_name: result[0]['user_name'])
  end

  def self.database_connection 
    if ENV['RACK_ENV'] == 'test'
      @@connection = PG.connect :dbname => 'makers_bnb_manager_test'
    else
      @@connection = PG.connect :dbname => 'makers_bnb_manager'
    end
  end

  def self.add_user_and_return_info(name, user_name)
    @@connection.exec(
      "INSERT INTO users (name, user_name) 
      VALUES ('#{name}', '#{user_name}') 
      RETURNING id, name, user_name;"
    )
  end

  def self.find_user_and_return_info(user_name)
    @@connection.exec(
      "SELECT *
       FROM users
       WHERE user_name = '#{user_name}';"
    )
  end
end
