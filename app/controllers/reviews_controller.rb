class ReviewsController < ApplicationController
	before_action :load_book

	def create
		@review = @book.reviews.new(review_params)
		if @review.save
			redirect_to @book, notice: 'Thanks for your review!'
		else
			redirect_to @book, alert: 'Unable to add review'
		end
	end

	def destroy
		@review = @book.reviews.find(prarms[:id])
		@review.destroy
		redirect_to @book, notice: 'Review Deleted'
	end

	private

	def load_book
	  @book=Book.find(params[:book_id])
	end

  def review_params
  	params.require(:review).permit(:username, :email, :body)
  end

end
