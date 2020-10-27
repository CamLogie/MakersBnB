require_relative 'user'

class BnBManager

  def initialize(user_class = User)
    @user_class = user_class
  end

  #This will raise errors for functional issues before sending to User class, and make formatting consistent
  def sign_up(name:, user_name:)
    user_name = user_name.downcase 
    @user_class.add(name: name, user_name: user_name)
  end
end