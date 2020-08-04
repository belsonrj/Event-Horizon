class Event < ApplicationRecord
    validates :name, presence: true 
    validates :date, presence: true
    has_many :comments
    has_many :users, through: :comments

    #def comments_attributes=(comment_attributes)
    #    comment_attributes.values.each do |comment_attribute|
    #      comment = Comment.find_or_create_by(comment_attribute)
    #      self.comment_attributes.build(comment: comment)
    #    end
    #end
end