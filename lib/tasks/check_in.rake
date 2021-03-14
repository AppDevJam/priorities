task ({:check_in => :environment}) do
  # Find all priorities for today
  cutoff_date = Date.today
  
  today_priorities = Priority.where(:day => cutoff_date)

  # Send alert if it is past 12pm and an alert has not been sent yet 
  
  
  need_reminder_priorities = today_priorities.where({ :alert_sent => false})

  p need_reminder_priorities.count


  need_reminder_priorities.each do |a_priority|
    p a_priority.description
    p a_priority.user.phone_number

    a_priority.alert_sent = true
    a_priority.save
  end




end