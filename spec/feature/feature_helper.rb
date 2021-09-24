

def register
  visit('/')
  click_button('Login / Register')
  fill_in('register_password', with: 'blablabla')
  fill_in('register_email', with: 'blablabla@gmail.com')
  click_button('register')
end

def login
  visit('/')
  click_button('Login / Register')
  fill_in('login_password', with: 'blablabla')
  fill_in('login_email', with: 'blablabla@gmail.com')
  click_button('login')
end
