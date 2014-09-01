require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, :type => :controller do


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @book = FactoryGirl.create(:book)
    # @review = FactoryGirl.create(:review, book: @book)
  end

  describe "create" do
    it "assigns a new review as @review" do
      @review = Review.create FactoryGirl.attributes_for(:review) #, valid_session
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "create" do
    it "creates a new Review" do
      expect {
        Review.create FactoryGirl.attributes_for(:review) #, valid_session
      }.to change(Review, :count).by(1)
    end

    it "assigns a newly created review as @review" do
      @review = Review.create FactoryGirl.attributes_for(:review) #, valid_session
      expect(assigns(:review)).to be_a(Review)
      expect(assigns(:review)).to be_persisted
    end

    it "redirects to the created book" do
      # @review.destroy
      @review = Review.create FactoryGirl.attributes_for(:review) #, valid_session
      expect(response).to redirect_to(@book)
    end

    it "sends an email to the reviewee" do
      expect {
        Review.create FactoryGirl.attributes_for(:review) #, valid_session
      }.to change {ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested review" do
      expect {
        @review.destroy 
      }.to change(Review, :count).by(-1)
    end
  end

end