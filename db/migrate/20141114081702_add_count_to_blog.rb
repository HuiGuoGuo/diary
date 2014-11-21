class AddCountToBlog < ActiveRecord::Migration
  def change
    add_column :blogs,:views_count,:integer 
  end
end
