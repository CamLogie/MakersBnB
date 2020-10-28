require_relative '../../lib/user.rb'

describe User do

  describe ".add" do 
    it "creates a new user" do 
      new_user = User.add(name: 'Bob', user_name: 'bob_008')

      expect(new_user).to be_a User
      expect(new_user.name).to eq 'Bob'
      expect(new_user.user_name).to eq 'bob_008'
    end
  end

  describe ".find" do
    it 'finds matching users' do
      test_add_user
      user_find = User.find?('bob_009')
      expect(user_find).to be true
    end

    it 'returns false if user is not found' do
      test_add_user
      user_find = User.find?('peepzgalore')
      expect(user_find).to be false
    end

  end

end
