require 'rails_helper'

RSpec.describe "attachment_images/index", :type => :view do
  before(:each) do
    assign(:attachment_images, [
      AttachmentImage.create!(
        :attachment_image_file_name => "Attachment Image File Name",
        :attachment_image_content_type => "Attachment Image Content Type",
        :attachment_image_file_size => 1
      ),
      AttachmentImage.create!(
        :attachment_image_file_name => "Attachment Image File Name",
        :attachment_image_content_type => "Attachment Image Content Type",
        :attachment_image_file_size => 1
      )
    ])
  end

  it "renders a list of attachment_images" do
    render
    assert_select "tr>td", :text => "Attachment Image File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Attachment Image Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
