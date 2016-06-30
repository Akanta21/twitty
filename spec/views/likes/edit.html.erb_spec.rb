require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :post_id => 1,
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input#like_post_id[name=?]", "like[post_id]"

      assert_select "textarea#like_body[name=?]", "like[body]"

      assert_select "input#like_user_id[name=?]", "like[user_id]"
    end
  end
end
