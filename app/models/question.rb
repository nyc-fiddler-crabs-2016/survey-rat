class Question < ActiveRecord::Base
  validates :content, presence: true

  has_many :possible_choices
  has_many :choices
  belongs_to :survey
end
