class Author < ApplicationRecord
  
  	#generate slug
    extend FriendlyId
    include SlugGenerator
  	friendly_id :slug_value, use: :slugged


    #relationships
    has_and_belongs_to_many :books

    #validations
    validates :first_name, :last_name, :date_of_birth, presence: true

    def author_error
    	self.errors.full_messages.join(', ')
    end
end
