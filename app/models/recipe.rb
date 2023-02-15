class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods

  validates :name, :description, presence: true

  def public?
    public
  end
end
