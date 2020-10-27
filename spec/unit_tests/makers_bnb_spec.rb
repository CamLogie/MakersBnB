require_relative '../../lib/bnb_manager.rb'
require_relative '../../lib/user.rb'

describe MakersBnB do 
  let(:new_user) { double :user, name: "Bob", user_name: "bob_007" }
  let(:user_class_mock) { double :user_class, add: new_user }
  
  describe '#sign_up' do
    it "returns the user's name and user_name" do
      makers_bnb = BnBManager.new(user_class_mock)
      details = makers_bnb.sign_up(name: 'Bob', user_name: 'bob_007')

      expect(details).to eq new_user
      expect(details.name).to eq "Bob"
      expect(details.user_name).to eq "bob_007"
    end
  end
end