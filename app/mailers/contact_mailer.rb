class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def new(contact)
    @name = contact.name
    @email = contact.email
    @message = contact.message
    mail(to: 'jakemoldham@gmail.com', subject: 'Email from #{@name}', from: @email)
  end
end
