feature 'Homepage has text on it' do
  scenario 'it says hello world' do
    visit('/')
    expect(page).to have_content 'hello world'
  end
end