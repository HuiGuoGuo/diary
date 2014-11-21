class CreateUserInformations < ActiveRecord::Migration
  def change
    create_table :user_informations do |t|
      t.string :name #姓名
      t.string :sex #性别
      t.string :marry #是否婚配
      t.string :country #国籍
      t.date :birth #生日
      t.integer :age, :defult => 0 #年龄
      t.integer :phone #电话
      t.string :qq  #QQ号码
      t.string :eamil #邮箱
      t.string :address #地址
      t.string :individuality_explanation #个性说明
      t.text :introduce  #自我介绍
      t.belongs_to :attachment_image #头像
      t.belongs_to :user #与用户关联

      t.timestamps
    end
    add_column :users ,:user_information_id, :integer
  end
end
