class Category < ApplicationRecord
has_many :storie_categories
has_many :storie, through: :storie_categories
validates :name, presence: true, length: { minimum: 3, maximum: 25 }
validates_uniqueness_of :name
end
