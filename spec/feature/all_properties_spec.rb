feature 'View all properties' do
  scenario 'the user can see all properties available' do
    PGDatabase.insert_property(name: 'House1', description:'this is a description', price:  5, availability: true)
    
    # connection.exec("INSERT INTO properties (name, description, price, availability) VALUES ('House1','this is a description', 5, true);")
    visit('/')
    
    expect(page).to have_content 'House1'
    expect(page).to have_content 'this is a description'
    expect(page).to have_content 5
    expect(page).to have_content 't'

  end
end
