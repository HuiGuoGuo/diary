class AddClumnToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :user_id, :integer
    add_column :blogs, :upload_id, :integer
    add_column :blogs, :type, :string
  end
end
