class Fridge < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
