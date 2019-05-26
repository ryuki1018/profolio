class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :content, length: { maximum: 255 }
        
  
  
            
  has_secure_password     
  has_many :items
  
    def self.search(search)
      if search
          Item.where(['content LIKE ?', "#{search}"])
      else
        Item.all
        flash[:danger] = '#{search}の検索結果はありませんでした'
      end
    end
end
