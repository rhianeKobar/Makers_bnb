feature 'able to see own bookings' do

  scenario 'button exists when logged in' do
    register
    expect(page).to have_button("My Requests")
  end

  scenario 'button does not exist when logged out' do
    visit('/')
    expect(page).not_to have_button("My Requests")
  end

  scenario 'user is able to see requests for their own property' do
    register
    add_property
    click_button 'Logout'
    register_two
    click_button 'book'
    click_button 'Logout'
    login
    click_button 'My Requests'
    expect(page).to have_content 'example name'
    expect(page).to have_content 'user@gmail.com'
    expect(page).to have_selector(:link_or_button, 'Accept')
  end
end











