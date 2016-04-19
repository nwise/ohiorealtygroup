class ContactUsForm
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  attr_accessor :first_name, :last_name, :address1, :address2, :city, :state, :zip, :phone, :email_address, :company, :comments

  validates_presence_of :first_name, :last_name, :address1, :city, :state, :zip, :phone, :email_address

  validates_format_of :phone,
                      :with => /^(1([\-\.]{1})?)?[0-9]{3}([\-\.]{1})?[0-9]{3}([\-\.]{1})?[0-9]{4}$/,
                      :message => 'is invalid'

  validates_format_of :first_name, :last_name, :address1, :address2, :city,
                      :with    => /^[a-zA-Z0-9\' ,.&\/\-]*$/,
                      :message => 'contains invalid characters.<br>
                                   The following characters are allowed:<br>
                                   - alphanumeric,<br>
                                   - spaces,<br>- commas,<br>- periods,<br>- single quotes<br>- and dashes'

  validates_inclusion_of  :state,
                          :in => %w{ AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN
                                     IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH
                                     NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT
                                     VT VA WA WV WI WY},
                          :message => "must choose a state"
  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def persisted?
    false
  end
end
