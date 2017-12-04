class OrderNotifier < ActionMailer::Base
  default from: 'tky <tky@gmail.com>'

  def recived
    @greeting = "hello"

    mail to: "tky1@gmail.com"
  end

  def shipped
    @greeting = "hello"

    mail to: "tky1@gmail.com"
  end
end



