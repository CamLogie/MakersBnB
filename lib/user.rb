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

end