class Choice < ActiveRecord::Base
  # scope to all uniqueness true

  validates :user, null: false, :uniqueness => {scope: :question}
  validates :possible_choice, null: false
  validates :question, null: false

  belongs_to :user
  belongs_to :possible_choice
  belongs_to :question
  belongs_to :taken_survey

  def self.has_already_answered?(user_id, question_id)
    Choice.find_by(user_id: user_id, question_id: question_id)
  end
end
