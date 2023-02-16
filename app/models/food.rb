class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user, foreign_key: 'user_id'

  validates :name, :measurement_unit, :price, :quantity, presence: true
end
