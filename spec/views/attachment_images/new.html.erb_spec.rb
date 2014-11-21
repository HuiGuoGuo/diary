require 'rails_helper'

RSpec.describe "attachment_images/new", :type => :view do
  before(:each) do
    assign(:attachment_image, AttachmentImage.new(
      :attachment_image_file_name => "MyString",
      :attachment_image_content_type => "MyString",
      :attachment_image_file_size => 1
    ))
  end

  it "renders new attachment_image form" do
    render

    assert_select "form[action=?][method=?]", attachment_images_path, "post" do

      assert_select "input#attachment_image_attachment_image_file_name[name=?]", "attachment_image[attachment_image_file_name]"

      assert_select "input#attachment_image_attachment_image_content_type[name=?]", "attachment_image[attachment_image_content_type]"

      assert_select "input#attachment_image_attachment_image_file_size[name=?]", "attachment_image[attachment_image_file_size]"
    end
  end
end
