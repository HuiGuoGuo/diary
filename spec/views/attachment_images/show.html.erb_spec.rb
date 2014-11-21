require 'rails_helper'

RSpec.describe "attachment_images/show", :type => :view do
  before(:each) do
    @attachment_image = assign(:attachment_image, AttachmentImage.create!(
      :attachment_image_file_name => "Attachment Image File Name",
      :attachment_image_content_type => "Attachment Image Content Type",
      :attachment_image_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Attachment Image File Name/)
    expect(rendered).to match(/Attachment Image Content Type/)
    expect(rendered).to match(/1/)
  end
end
