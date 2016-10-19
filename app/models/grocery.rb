class Grocery < ActiveRecord::Base
  belongs_to :fridgecategory

  validates :name, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :exp_date, presence: true
  validates :fridgecategory_id, presence: true, numericality: { only_integer: true }
end
