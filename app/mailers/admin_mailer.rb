class AdminMailer < ActionMailer::Base
  default from: "admin@lecter.com"

  def notity_about_review(user,book)
  	@user = user
  	@book = book
  	mail(to: user.email, subject: "Your book was reviewed!")
  end

end
