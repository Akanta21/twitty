require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(
        :post_id => 2,
        :body => "MyText",
        :user => nil
      ),
      Like.create!(
        :post_id => 2,
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of likes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
