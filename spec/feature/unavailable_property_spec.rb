feature 'cannot see unavailable property' do

  xscenario 'cannot see book' do
    user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
    PGDatabase.insert_property(name: 'House999', description:'this is a description', price:  5, availability: "1", user_id: user.id)
    PGDatabase.insert_property(name: 'House12322', description:'this is a description', price:  5, availability: "0", user_id: user.id)
    visit('/')
    expect(page).to have_content('House999')
    expect(page).not_to have_content('House12322')
  end

end
