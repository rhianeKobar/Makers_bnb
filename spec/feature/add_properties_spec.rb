# feature 'Adding a Property' do
#   scenario 'A user can properties to the current listing' do
#     visit ('/add')
#     fill_in('name', with: 'example name')
#     fill_in('description', with: 'example description')
#     fill_in('price', with: 5)
#     fill_in('availability', with: true)
#     click_button('Submit')

#     expect(page).to have_content 'example name'
#     expect(page).to have_content 'example description'
#     expect(page).to have_content 5
#     expect(page).to have_content true
#   end
# end