class ContactMailer < ActionMailer::Base

  def contact_us_email( contents )
    @contents = contents
    mail(to: Ohiorealtygroup::Application.config.contact_recipient, bcc: 'nathan@wise-ideas.com', subject: 'Contact Us Form', from: @contents.email_address, headers: {}) do |format|
      format.text { render :contact_us_email }
    end
  end
end
