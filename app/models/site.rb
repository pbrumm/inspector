class Site < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_one :user
  has_many :inspections
  accepts_nested_attributes_for :inspections

end
