require 'pg'

def setup_test_database
#   p 'Setting up test database...'
  connection = PG.connect(dbname: 'makers_bnb_manager_test')
  connection.exec("TRUNCATE users;")
  connection.exec("TRUNCATE properties;")
end
