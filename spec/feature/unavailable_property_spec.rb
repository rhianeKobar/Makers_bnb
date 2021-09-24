feature 'cannot see unavailable property' do

  scenario 'cannot see book' do

    PGDatabase.insert_property(name: 'House999', description:'this is a description', price:  5, availability: true, user_id: user.id)

    PGDatabase.insert_property(name: 'House12322', description:'this is a description', price:  5, availability: false, user_id: user.id)
    visit('/')
    expect()
  end

end