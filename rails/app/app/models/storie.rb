class Storie < ApplicationRecord
validates :name, presence: true, length: {minimum: 5, maximum: 50}
validates :content, presence: true

end
