class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, :description, presence: true

  def public?
    public
  end
end
