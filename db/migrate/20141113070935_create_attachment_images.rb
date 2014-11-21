class CreateAttachmentImages < ActiveRecord::Migration
  def change
    create_table :attachment_images do |t|
      t.string :attachment_image_file_name
      t.string :attachment_image_content_type
      t.integer :attachment_image_file_size
      t.datetime :attachment_image_updated_at

      t.timestamps
    end
    add_column :blogs, :attachment_image_id, :integer
  end
end
