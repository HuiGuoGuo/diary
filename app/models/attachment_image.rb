class AttachmentImage < ActiveRecord::Base
  attr_accessible :attachment_image_content_type, :attachment_image_file_name, :attachment_image_file_size, :attachment_image_updated_at ,:attachment_image

  has_attached_file :attachment_image,
    :path =>  "#{Rails.root}/public/image/:attachment/:id/:style/:filename",
    :url =>  "/image/:attachment/:id/:style/:filename",
    :default_url => "/assets/demo/user-1.jpg"
  #  :default_url => "/assets/default.png"
   do_not_validate_attachment_file_type :attachment_image

end
