

def test_connection
  @connection = PG.connect :dbname => 'makers_bnb_manager_test'
end

def test_add_user
  test_connection
  @connection.exec("INSERT INTO users (name, user_name) VALUES ('Bob', 'bob_009');")
end

def parse_date_to_s(month, day, year)
  Date.parse "#{year}-#{month}-#{day}"
end
