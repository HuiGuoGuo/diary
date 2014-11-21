require 'rails_helper'

RSpec.describe "comments/show", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :context => "Context"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Context/)
  end
end
