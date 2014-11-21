require 'rails_helper'

RSpec.describe "user_informations/edit", :type => :view do
  before(:each) do
    @user_information = assign(:user_information, UserInformation.create!())
  end

  it "renders the edit user_information form" do
    render

    assert_select "form[action=?][method=?]", user_information_path(@user_information), "post" do
    end
  end
end
