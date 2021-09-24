feature 'Cant see "book" if not signed in' do
  scenario 'cannot see book if unavailable' do
    user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
    PGDatabase.insert_property(name: 'House1', description:'this is a description', price:  5, availability: true, user_id: user.id)
    visit('/')
    expect(page).not_to have_button('book')
    expect(page).not_to have_button('add')
  end
end

feature 'Cant see "login/register" if signed in' do
  scenario 'logout is shown' do
    user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
    PGDatabase.insert_property(name: 'House1', description:'this is a description', price:  5, availability: true, user_id: user.id)
    register
    expect(page).not_to have_button('Login / Register')
    expect(page).to have_button('Logout')
  end
end
