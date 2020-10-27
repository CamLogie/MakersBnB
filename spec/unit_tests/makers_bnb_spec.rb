require_relative '../../lib/makers_bnb.rb'

describe MakersBnB do 
  
  describe '.sign_up' do
    it "returns the user's name and user_name" do
      details = MakersBnB.sign_up(name: 'Bob', user_name: 'bob_007')

      expect(details).to be_a Hash
      expect(details[:name]).to eq "Bob"
      expect(details[:user_name]).to eq "bob_007"
    end
  end
end