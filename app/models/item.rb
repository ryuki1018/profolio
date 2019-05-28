class Item < ApplicationRecord

    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 255 }
    
    has_many :reverses_of_relationship , class_name: 'Relationship',foreign_key: 'user_id'
    has_many :liked, through: :reverses_of_relationship, source: :user
end
