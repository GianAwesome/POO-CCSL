Given /no user exist/ do
  User.destroy_all
end

Given /the following user exist/ do |users_table|
  users_table.hashes.each do |user|    
    User.create(user)
  end
end

Given /the following admin exists/ do |users_table|
  users_table.hashes.each do |user|    
    User.create(username: user["username"], password: user["password"], admin: true)
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

Then /the user "(.+)" does not exists/ do |username|
  User.exists?(username: username)
end

Then /the user "(.+)" exists/ do |username|
  User.exists?(username: username)
end

Then /the user "(.+)" is admin/ do |username|
  User.find_by(username: username).admin
end

Then /the user "(.+)" is not admin/ do |username|
  !User.find_by(username: username).admin
end

Then /the user "(.+)" has the password "(.+)"/ do |username, password|
  User.find_by(username: username).authenticate(password)
end

When(/^I delete the user with the name "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Apagar")
  page.driver.browser.switch_to.alert.accept
end

When(/^I make admin the user with the name "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Tornar Administrador")
  page.driver.browser.switch_to.alert.accept
end

When /I make user the admin with the name "(.*?)"/ do |name|
  find('tr', text: name).click_link("Tornar Usuario Comum")
  page.driver.browser.switch_to.alert.accept
end