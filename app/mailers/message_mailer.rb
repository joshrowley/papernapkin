class MessageMailer < ActionMailer::Base
  default from: "joshua.f.rowley@gmail.com"
  def inquiry(message)
    @message = message
    mail(:to => "joshua.f.rowley@gmail.com" , :subject => "Re: Papernapkin.com, from #{message.contact.full_name}", :reply_to => "#{message.contact.email}")
  end
end