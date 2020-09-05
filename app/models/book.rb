class Book < ApplicationRecord

  	#generate slug
    extend FriendlyId
    include SlugGenerator
  	friendly_id :slug_value, use: :slugged


    #relationships
    has_and_belongs_to_many :authors

    #validations
    validates :title, presence: true
end
