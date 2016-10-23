class Recipe < ActiveRecord::Base
  has_many :groceries
  validates :title, presence: true
end
