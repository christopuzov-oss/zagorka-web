class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ApplicationMailer.contact_mail(@contact).deliver_later
      redirect_to contacts_path, notice: t('.success')
    else
      flash.now[:error] = t('.error')
      render 'contacts/index'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :phone, :about)
  end
end
