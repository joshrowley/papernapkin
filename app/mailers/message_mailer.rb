class MessageMailer < ActionMailer::Base
  default from: "michael@papernapkin.com"
end

class MessageMailer < ActionMailer::Base
  default from: ""
  def inquiry(message)
     mail(:to => "joshua.f.rowley@gmail.com" , :subject => "Re: Papernapkin.com from #{message.contact.full_name}", :from => message.contact.email)
  end
end
