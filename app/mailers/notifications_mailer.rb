class NotificationsMailer < ActionMailer::Base
  default :from => 'no-reply@taskmanager.com'

  def due_date_reminder(user, task)
    @user = user
    @task = task
    mail(:to => @user.email, :subject => "Task Due Reminder: #{@task.title}")
  end
end 