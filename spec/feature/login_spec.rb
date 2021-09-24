feature 'can log in after registering' do
  scenario 'log  in' do
    register
    expect(page).not_to have_button('Login / Register')
    click_button('Logout')
    login
    expect(page).to have_button('Logout')
  end
end