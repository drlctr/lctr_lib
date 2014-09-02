require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    @approved_books =  [
      FactoryGirl.create(:book),
      FactoryGirl.create(:book)
      ]
    @deactivated_books = [
      FactoryGirl.create(:book),
      FactoryGirl.create(:book)
      ]
  end

  it "renders a list of approved and deactivated books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end

end