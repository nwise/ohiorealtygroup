Then /^I should receive an email notification$/ do
  unread_emails_for(current_email_address).size.should == 1
  open_email(current_email_address)
  current_email.should have_subject(/Contact Us Form/)
end

def current_email_address
  'testing@wrladv.com'
end

Then /^I should not receive an email notification$/ do
  unread_emails_for(current_email_address).size.should == 0
end
