

def register
  visit('/')
  click_button('Login / Register')
  fill_in('register_password', with: 'blablabla')
  fill_in('register_email', with: 'blablabla@gmail.com')
  click_button('register')
end

def register_two
  visit('/')
  click_button('Login / Register')
  fill_in('register_password', with: 'user 2')
  fill_in('register_email', with: 'user@gmail.com')
  click_button('register')
end


def login
  visit('/')
  click_button('Login / Register')
  fill_in('login_password', with: 'blablabla')
  fill_in('login_email', with: 'blablabla@gmail.com')
  click_button('login')
end

def add_property
  click_button('Add')
  fill_in('name', with: 'example name')
  fill_in('description', with: 'example description')
  fill_in('price', with: 5)
  fill_in('available', with: 1)
  click_button('add')
end
