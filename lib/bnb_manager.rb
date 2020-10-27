require_relative 'user'

class BnBManager

  def initialize(user_class = User)
    @user_class = user_class
  end

  def sign_up(name:, user_name:)
    user_name = user_name.downcase 
    @user_class.add(name, user_name)
  end
end