class MessagesController < ApplicationController
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def create
    @contact = Contact.find_or_create_by_email( :first_name => params[:first_name],
                                                :last_name => params[:last_name],
                                                :email => params[:email]  )
    @message = @contact.messages.build(:content => params[:content])

    respond_to do |format|
      if @contact.save
        MessageMailer.inquiry(@message).deliver
        format.html { redirect_to new_message_path, notice: 'Message was successfully sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
