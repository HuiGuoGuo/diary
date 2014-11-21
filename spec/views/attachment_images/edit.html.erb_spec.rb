require 'rails_helper'

RSpec.describe "attachment_images/edit", :type => :view do
  before(:each) do
    @attachment_image = assign(:attachment_image, AttachmentImage.create!(
      :attachment_image_file_name => "MyString",
      :attachment_image_content_type => "MyString",
      :attachment_image_file_size => 1
    ))
  end

  it "renders the edit attachment_image form" do
    render

    assert_select "form[action=?][method=?]", attachment_image_path(@attachment_image), "post" do

      assert_select "input#attachment_image_attachment_image_file_name[name=?]", "attachment_image[attachment_image_file_name]"

      assert_select "input#attachment_image_attachment_image_content_type[name=?]", "attachment_image[attachment_image_content_type]"

      assert_select "input#attachment_image_attachment_image_file_size[name=?]", "attachment_image[attachment_image_file_size]"
    end
  end
end
