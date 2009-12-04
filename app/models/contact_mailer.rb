class ContactMailer < ActionMailer::Base

  def contact_us_email( contents )    
    @subject                = 'Contact Us Form'
    @body["contents"]       = contents
    @recipients             = CONTACT_FORM_RECIPIENT
    @from                   = contents.email_address
    @sent_on                = Time.now
    @headers                = {}
  end  
end