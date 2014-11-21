require 'rails_helper'

RSpec.describe "user_informations/index", :type => :view do
  before(:each) do
    assign(:user_informations, [
      UserInformation.create!(),
      UserInformation.create!()
    ])
  end

  it "renders a list of user_informations" do
    render
  end
end
