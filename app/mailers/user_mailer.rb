class UserMailer < ApplicationMailer

 # Adding helper method to the Mailer View
  add_template_helper(ApplicationHelper)
  
  def send_mail(schedule, users_list)
    @schedule = schedule
    mail(to: users_list, subject: "Hello World")
  end
end
