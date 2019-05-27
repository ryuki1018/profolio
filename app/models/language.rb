class Language < ApplicationRecord
    
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
end
