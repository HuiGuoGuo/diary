require 'rails_helper'

RSpec.describe "user_informations/show", :type => :view do
  before(:each) do
    @user_information = assign(:user_information, UserInformation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
