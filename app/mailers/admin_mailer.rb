class AdminMailer < ActionMailer::Base
  default from: "admin@lecter.com"

  def notify_about_review(book, review)
  	@book = book
  	@review = review
  	mail(to: @book.user.email, subject: "Your book, #{@book.title} was reviewed!")
  end

end
