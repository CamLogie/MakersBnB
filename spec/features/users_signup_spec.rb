feature 'Homepage' do

  scenario 'displays the name of the website' do
    visit '/'
    expect(page).to have_content 'Welcome to MakersBnB'
  end

  scenario 'enables the user to sign up' do
    visit '/'
    fill_in(:name, with: 'Bob')
    fill_in(:sign_up_user_name, with: 'Bob_007')
    click_button('Sign Up')
    expect(page).to have_content 'Available Properties'
  end

  scenario 'does not allow double sign-up' do
    test_add_user

    visit '/'
    fill_in(:name, with: 'Bob')
    fill_in(:sign_up_user_name, with: 'Bob_009')
    click_button('Sign Up')
    expect(page).to have_content 'This user name is already registered!'
  end

  scenario 'it allows the user to sign in if their username already exists' do
    test_add_user
    visit '/'
    fill_in(:sign_in_user_name, with: 'Bob_009')
    click_button('Sign In')
    expect(page).to have_content 'Available Properties'
  end
end
