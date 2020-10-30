
def insert_test_properties
  Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", "2020-10-29", "2020-11-01", user.id)
  Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland", "2020-11-05", "2020-11-10", user.id)
  Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland", "2020-10-30", "2020-11-15", user.id)
# test_add_unavailable_date
end


def test_connection
  @connection = PG.connect :dbname => 'makers_bnb_manager_test'
end

def test_add_user
  test_connection
  @connection.exec("INSERT INTO users (name, user_name) VALUES ('Bob', 'bob_009');")
end

def three_days_from_now
  date = DateTime.now
  date.next_day(3).strftime('%B %d, %Y')
end

def test_add_unavailable_date
  test_connection
  today_date = today
  result = @connection.exec(
    # Updating properties sends them to the end of the list in SQL Table
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
    fill_in(:user_name, with: 'Bob_007')
    click_button('Submit')
    click_link('New Property Listing')
end
