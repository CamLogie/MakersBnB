feature 'Homepage' do

  scenario 'displays the name of the website' do
    visit '/'
    expect(page).to have_content 'Welcome to MakersBnB'
  end


end