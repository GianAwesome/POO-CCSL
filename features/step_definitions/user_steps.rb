Given /no user exist/ do
  User.destroy_all
end

Given /the following user exist/ do |users_table|
  users_table.hashes.each do |user|    
    User.create(user)
  end
end

Given /I am logged in as "(.*)", "(.*)"$/ do |username, password|  
  visit("/login")
  fill_in("session_username", :with => username)
  fill_in("session_password", :with => password)
  click_button("Entrar")
end

Then /I should see an admin password/ do
  admin_pass = /Senha: [A-Za-z0-9]{7}/
  if page.respond_to? :should
    page.should have_content(admin_pass)
  else
    assert page.has_content?(admin_pass)
  end
end

Then /the user "(.+)" exists/ do |username|
  User.exists?(username: username)
end