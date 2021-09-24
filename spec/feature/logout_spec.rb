feature 'Cant see "book" if signed out' do
  scenario 'cannot see book' do
    visit('/')
    click_button('Login / Register')
    fill_in('register_password', with: 'blablabla')
    fill_in('register_email', with: 'blablabla@gmail.com')
    click_button('register')
    expect(page).not_to have_button('Login / Register')
    click_button('Logout')
    expect(page).not_to have_button('book')
    expect(page).to have_button('Login / Register')
  end
end