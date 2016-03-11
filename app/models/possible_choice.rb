class PossibleChoice < ActiveRecord::Base
  validates :option, presence: true

  has_many :choices
  belongs_to :question
end
