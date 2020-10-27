require 'pg'

def setup_test_database
  p 'Setting up test database...'

  # Set connection with database
  connection = PG.connect(dbname: 'makers_bnb_manager_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE users;")
end
