Given /^I have no realtors$/ do
  Realtor.destroy_all
end

Given /^I have a realtor named (.+)$/ do |name|
  Realtor.destroy_all
  Realtor.create(:name => name)
end

And /^I open the page$/ do
  save_and_open_page
end
