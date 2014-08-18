class AdminMailer < ActionMailer::Base
  default from: "admin@lecter.com"

  def notify_about_review(book, review)
  	@book = book
  	@review = review
  	if @book.user.user_profile.mail_pref_rev
  	  mail(to: @book.user.email, subject: "Your book, #{@book.title} was reviewed!")
  	end
  end

  def notify_about_rating(book_id, stars, rater)
  	@book = Book.find(book_id)
  	puts "The book is #{Book.find(book_id).title}"
  	@stars = stars
  	@rater = rater
  	if @book.user.user_profile.mail_pref_rat
  	  mail(to: @book.user.email, subject: "Your book, #{@book.title} was rated!")
  	end
  end

end
