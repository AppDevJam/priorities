task ({:check_in => :environment}) do
  
  Twilio::REST::Client
   
  # Find all priorities for today
  cutoff_date = Date.today
  
  today_priorities = Priority.where(:day => cutoff_date)

  # Send alert if it is past 12pm and an alert has not been sent yet 
  
  
  need_reminder_priorities = today_priorities.where({ :alert_sent => false})

  p need_reminder_priorities.count


  need_reminder_priorities.each do |a_priority|
    a_priority.description
    a_priority.user.phone_number

      twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
      twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
      twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

      twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

      sms_parameters = {
        :from => twilio_sending_number,
        :to => a_priority.user.phone_number,
        :body => "Remember, a priority for today is " + a_priority.description + ". Make sure to focus on it!"
        }

      twilio_client.api.account.messages.create(sms_parameters)

    a_priority.alert_sent = true
    a_priority.save
  end
end