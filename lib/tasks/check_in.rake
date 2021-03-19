task ({:check_in => :environment}) do
  
  Twilio::REST::Client
  
  # p Date.today
  
  # Find all priorities that have not yet been accomplished

  unaccomplished_priorities = Priority.where(:priority_accomplished => false)
  
  # Find unaccomplished priorities due today or in the past

  today_priorities = unaccomplished_priorities.where("day <= ?", Date.today)

  # p today_priorities.count

  # Send an alert about each unaccomplished priority if it is noon or later that directs 
  
  if Time.now.hour >= 12
    today_priorities.each do |a_priority|
      a_priority.description
      a_priority.user.phone_number

        twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
        twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
        twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

        twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

        sms_parameters = {
          :from => twilio_sending_number,
          :to => a_priority.user.phone_number,
          :body => "Remember, one of your priorities for today is " + a_priority.description + ". If you're done, congratulations! Mark it as accomplished to stop these reminders."
          }

        twilio_client.api.account.messages.create(sms_parameters)

      a_priority.save
    end
  else
  end
end