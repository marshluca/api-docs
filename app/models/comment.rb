class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content                              # 评论内容
  embeds_one :author                          # 创建作者
  embedded_in :doc, :inverse_of => :comments

  validates_presence_of :content
end
