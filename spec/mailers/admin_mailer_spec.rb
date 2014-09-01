require "rails_helper"

RSpec.describe AdminMailer, :type => :mailer do
  describe 'notify_about_review' do

  	before :each do
  		@user = FactoryGirl.create(:user)
  		@book = FactoryGirl.create(:book, user: @user)
  		@profile = FactoryGirl.create(:user_profile, user: @user)
  		@rvw = FactoryGirl.create(:review, user: @user)
  		@mail = AdminMailer.notify_about_review(@book,@rvw).deliver
  	end

  	it 'renders the subject' do
  		expect(@mail.subject).to eq("Your book, #{@book.title} was reviewed!")
  	end

  	it 'renders the receiver email' do
  		expect(@mail.to).to eq(["#{@book.user.email}"])
  	end

  	it 'renders the sender email' do
  		expect(@mail.from).to eq(['admin@lecter.com'])
  	end

  end

	describe 'notify_about_rating' do
		before :each do
			@user = FactoryGirl.create(:user)
			@book = FactoryGirl.create(:book, user: @user)
			@profile = FactoryGirl.create(:user_profile, user: @user)
			@rate = FactoryGirl.create(:rate)
			@mail = AdminMailer.notify_about_rating(@book.id, @rate.stars, @user).deliver
		end

	  it 'renders the subject' do
	  	expect(@mail.subject).to eq("Your book, #{@book.title} was rated!")
	  end

	  it 'renders the receiver email' do
	  	expect(@mail.to).to eq(["#{@book.user.email}"])
	  end

	  it 'renders the sender email' do
	  	expect(@mail.from).to eq(['admin@lecter.com'])
	  end

	end

end
