feature 'Cant see "book" if signed out' do
  scenario 'cannot see book' do
    register
    expect(page).not_to have_button('Login / Register')
    click_button('Logout')
    expect(page).not_to have_button('book')
    expect(page).to have_button('Login / Register')
  end
end