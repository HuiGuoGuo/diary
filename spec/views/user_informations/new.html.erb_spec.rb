require 'rails_helper'

RSpec.describe "user_informations/new", :type => :view do
  before(:each) do
    assign(:user_information, UserInformation.new())
  end

  it "renders new user_information form" do
    render

    assert_select "form[action=?][method=?]", user_informations_path, "post" do
    end
  end
end
