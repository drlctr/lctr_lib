require 'rails_helper'

RSpec.describe Book, :type => :model do
  
  it 'detects when the book has reviews' do
    @book = FactoryGirl.create(:book)
    @review = FactoryGirl.create(:review, book: @book)
    expect(@book.has_reviews?).to eq(true)
  end

  it 'detects when the book does not have reviews' do
  	@book = FactoryGirl.create(:book)
  	expect(@book.has_reviews?).to eq(false)
  end

end
