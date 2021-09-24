feature 'Adding a Property' do
  scenario 'A user can properties to the current listing' do
    register
    click_button('Add')
    fill_in('name', with: 'example name')
    fill_in('description', with: 'example description')
    fill_in('price', with: 5)
    fill_in('available', with: 1)
    click_button('add')
    expect(page).to have_content 'example name'
    expect(page).to have_content 'example description'
    expect(page).to have_content 5
    expect(page).to have_content "t"
  end
end
