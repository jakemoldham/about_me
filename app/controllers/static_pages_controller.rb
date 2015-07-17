class StaticPagesController < ApplicationController

  def send_contact_mailer
  end

  def home
    @contact = Contact.new
  end

  def about
  end

  def contact
  end
end
