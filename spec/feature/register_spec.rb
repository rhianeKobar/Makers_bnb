feature 'Cant see "book" if not signed in' do
  scenario 'cannot see book if unavailable' do
    PGDatabase.insert_property(name: 'House1', description:'this is a description', price:  5, availability: true)
    visit('/')
    expect(page).not_to have_button('book')
    expect(page).not_to have_button('add')
  end
end

feature 'Cant see "login/register" if signed in' do
  scenario 'logout is shown' do
    PGDatabase.insert_property(name: 'House1', description:'this is a description', price:  5, availability: true)
    visit('/')
    click_button('Login / Register')
    fill_in('register_password', with: 'blablabla')
    fill_in('register_email', with: 'blablabla@gmail.com')
    click_button('register')
    expect(page).not_to have_button('Login / Register')
    expect(page).to have_button('Logout')
  end
end
