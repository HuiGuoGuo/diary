#encoding:utf-8
class UserInformation < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :name, :age, :sex, :birth, :marry, :tags, :country, :phone, :qq, :address, :individuality_explanation, :introduce ,:attr_accessible_id , :user_id
  # 添加标签的功能  
  acts_as_taggable  
  # 标签  
  acts_as_taggable_on :tags  

  belongs_to :attachment_image

  belongs_to :user


  COUNTRY = { "cn" => "中国", "an" => "美国",  "dg" => "德国", "uk" => "英国","sg" => "新加坡",
    "ch" => "瑞士", "fi" => "芬兰", "fr" => "法国", "cz" => "捷克", "dk" => "丹麦", "jp" => "小日本"}
  MARRY = {'ds' =>"单身", 'rl' => '热恋中', 'yh' => '已婚'}

  def self.get_country_select_options
    COUNTRY.invert.to_a
  end

  def self.get_marry_select_options
    MARRY.invert.to_a
  end

  def tags
    self.tag_list.to_a.join(",")
  end

  def tags=(tag)
    self.tag_list=tag.split(",")
  end

end
