class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :context
      t.belongs_to :blog
      t.belongs_to :user

      t.timestamps
    end
  end
end
