class UserMailer < ApplicationMailer
    def welcome_email
        mail(to:"2725546002@qq.com" ,subject:"Hi")
    end
end
