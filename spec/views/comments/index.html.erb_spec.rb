require 'rails_helper'

RSpec.describe "comments/index", :type => :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :context => "Context"
      ),
      Comment.create!(
        :context => "Context"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Context".to_s, :count => 2
  end
end
