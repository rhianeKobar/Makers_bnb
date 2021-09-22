# feature 'View all properties' do
#   scenario 'the user can see all properties available' do
#     connection = PG.connect(dbname: 'bnb_test')
#     connection.exec("INSERT INTO properties (name, description, price, availability) VALUES ('House1','this is a description', 5, true);")
#     visit('/')
    
#     expect(page).to have_content 'House1'
#     expect(page).to have_content 'this is a description'
#     expect(page).to have_content 5### maybe expect to see "available" on page if true
#   end
# end