class UserNotifierMailer < ApplicationMailer
    default :from => 'jim@openroad.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_lesson_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for your booking' )
    end
end
