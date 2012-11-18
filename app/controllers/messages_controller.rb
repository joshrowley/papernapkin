class MessagesController < ApplicationController
  def new
  end

  def create
    @contact = Contact.create( :first_name => params[:first_name],
                    :last_name => params[:last_name],
                    :email => params[:email]  )
    @contact.messages.build(:content => params[:content])
    @contact.save
  end
end
