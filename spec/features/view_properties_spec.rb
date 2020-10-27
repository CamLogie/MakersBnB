feature 'View Properties' do
  scenario 'A user can view a list of property names' do
    visit('/properties_list')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'Example Property'
    expect(page).to have_content 'Fake Property'
  end
end