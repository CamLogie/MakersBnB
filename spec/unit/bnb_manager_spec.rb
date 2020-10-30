require_relative '../../lib/bnb_manager.rb'
require_relative '../../lib/user.rb'

describe BnBManager do 
  let(:new_user) { double :user, name: "Bob", user_name: "bob_00.7" }
  let(:user_class_mock) { double :user_class, add: new_user, retrieve: new_user }
  
  describe '#sign_up' do
    before :each do
      @makers_bnb = BnBManager.new(user_class_mock)
      @details = @makers_bnb.sign_up(name: 'Bob', user_name: 'bob_00.7')
    end

    it "returns the user's name and user_name" do
      expect(@details).to eq new_user
      expect(@details.name).to eq "Bob"
      expect(@details.user_name).to eq "bob_00.7"
    end

    it 'returns an error message if username contains unusual punctuation' do
      incorrect_username_1 = @makers_bnb.sign_up(name: 'Bob', user_name: "bob_0'07")
      incorrect_username_2 = @makers_bnb.sign_up(name: 'Bob', user_name: 'bob_0"07')
      incorrect_username_3 = @makers_bnb.sign_up(name: 'Bob', user_name: 'bob_007!')

      expect(incorrect_username_1).to eq "Usernames can only include: letters, numbers, and these symbols: . - _"
      expect(incorrect_username_1).to eq incorrect_username_2
      expect(incorrect_username_1).to eq incorrect_username_3
    end

    it 'returns an error message if username if over 20 characters' do
      new_user = @makers_bnb.sign_up(name: 'Teresa', user_name: 'TeresaRodriguez1234567891023456')
      expect(new_user).to eq "Usernames can have a max of 20 characters"
    end

    it 'returns an error message if username if under 5 characters' do
      new_user = @makers_bnb.sign_up(name: 'Teresa', user_name: 'Ter')
      expect(new_user).to eq "Usernames must have at least 5 characters"
    end
  end

  describe '#sign_in' do
    before :each do
      @makers_bnb = BnBManager.new(user_class_mock)
      @details = @makers_bnb.sign_up(name: 'Bob', user_name: 'bob_00.7')
    end

    it 'checks if a user_name already exists in the database and returns the user' do
      @makers_bnb = BnBManager.new(user_class_mock)
      @details = @makers_bnb.sign_up(name: 'Bob', user_name: 'bob_00.7') 
      bob_user = @makers_bnb.sign_in('bob_00.7')
      expect(bob_user).to eq new_user
    end
  end
end
