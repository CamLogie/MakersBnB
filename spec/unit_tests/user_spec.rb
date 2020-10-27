require_relative '../../lib/user.rb'

describe User do

  describe ".add" do 
    it "creates a new user" do 
      new_user = User.add(name: 'Bob', user_name: 'bob_007')

      expect(new_user).to be_a User
      expect(new_user.name).to eq 'Bob'
      expect(new_user.user_name).to eq 'bob_007'
    end
  end
  
end
