class Grocery < ActiveRecord::Base
  belongs_to :fridgecategory

  validates :name, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :exp_date, presence: true
  validates :fridgecategory_id, presence: true, numericality: { only_integer: true }

  def self.expiration_check
    @expiring_groceries = []
    Grocery.all.each do |grocery|
      if grocery.exp_date.to_s == 2.day.from_now.strftime('%Y-%m-%d')
        @expiring_groceries << grocery
      end
    end
    return @expiring_groceries
  end
end
