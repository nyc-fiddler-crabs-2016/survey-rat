class Survey < ActiveRecord::Base
  validates :title, null: false

  belongs_to :user
  has_many :taken_surveys
  has_many :questions
end
