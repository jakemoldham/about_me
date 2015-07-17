class ContactMailer < ApplicationMailer

  def new(contact)
    @name = contact.name
    @email = contact.email
    @message = contact.message
    mail(to: 'jakemoldham@gmail.com', subject: "Email from #{@name} at #{@email}")
  end
end
