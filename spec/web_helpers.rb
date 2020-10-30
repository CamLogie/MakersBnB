
def insert_test_properties
  @property_1 = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", "2020-10-29", "2020-11-01", "150",
    "London Test", user.id,)
  @property_2 = Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland", "2020-11-05", "2020-11-10", "150",
    "London Test", user.id)
  @property_3 = Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland", "2020-10-30",
    "2020-11-15", "150", "London Test", user.id)
end


def test_connection
  @connection = PG.connect :dbname => 'makers_bnb_manager_test'
end

def test_add_user
  bnb_manager = BnBManager.new
  bnb_manager.sign_up(name: 'Bob', user_name: 'bob_009')
end

def three_days_from_now
  date = DateTime.now
  date.next_day(3).strftime('%B %d, %Y')
end

def test_add_unavailable_date
  test_connection
  today_date = today
  result = @connection.exec(
    "UPDATE properties
    SET 
      unavailable_dates = '#{today_date.strftime('%Y-%m-%d')}'
    WHERE
      listing_title = 'Unavailable Property';" 
    )
end

def sign_in_and_click
  visit '/'
  fill_in(:name, with: 'Bob')
  fill_in(:sign_up_user_name, with: 'Bob_007')
  click_button('Sign Up')
  click_button('New Property Listing')
end

def sign_in_with_existing_username
  test_add_user
  visit '/'
  fill_in(:sign_in_user_name, with: 'Bob_009')
  click_button('Sign In')
end
