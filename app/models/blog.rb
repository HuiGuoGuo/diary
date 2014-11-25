# encoding: utf-8
class Blog < ActiveRecord::Base
  # 添加标签的功能  
  acts_as_taggable  
  # 标签  
  acts_as_taggable_on :tags  
  has_many :comments

  attr_accessor :tags
  attr_accessible :context, :title, :tags

  belongs_to :user

  validates_presence_of :title, :context, :message => '不能为空'


  def tags
    self.tag_list.to_a.join(",")
  end

  def tags=(tag)
    self.tag_list=tag.split(",")
  end

end
