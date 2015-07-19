class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      ContactMailer.new(@contact).deliver
      redirect_to root_path, flash[:success] = "Message has been successfully sent."
    else
      flash[:danger] = "PLEASE! You can't leave stuff blank, fill it out!"
      redirect_to root_path
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
