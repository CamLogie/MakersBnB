require_relative 'user'

class BnBManager
  SYNTAX_ERROR = "Usernames can only include: letters, numbers, and these symbols: . - _"
  TOO_LONG_ERROR = "Usernames can have a max of 20 characters"
  TOO_SHORT_ERROR = "Usernames must have at least 5 characters"

  def initialize(user_class = User)
    @user_class = user_class
  end

  # This will raise errors for functional issues before sending to User class, 
  # and make formatting consistent
  def sign_up(name:, user_name:)
    user_name = user_name.downcase
    return SYNTAX_ERROR if include_punctuation?(user_name)
    return TOO_LONG_ERROR if too_long?(user_name)
    return TOO_SHORT_ERROR if too_short?(user_name)
    @user_class.add(name: name, user_name: user_name)
  end

  def sign_in(user_name)
    user_name = user_name.downcase
    @user_class.retrieve(user_name: user_name)
  end

  private
  
  def include_punctuation?(user_name)
    acceptable_punctuation = 'abcdefghijklmnopqrstuvwxyz.-_0123456789'
    user_name.chars do |char|
      return true unless acceptable_punctuation.include?(char)
    end
    false
  end

  def too_long?(user_name)
    user_name.chars.count > 20
  end

  def too_short?(user_name)
    user_name.chars.count < 5
  end
end
