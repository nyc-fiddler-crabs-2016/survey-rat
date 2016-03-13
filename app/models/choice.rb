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

  def percent_of(total_number_of_choices)
    self.to_f / total_number_of_choices.to_f * 100.0
  end

  def self.all_choices_in_taken_survey(id)
    self.where(taken_survey_id: id)
  end
end
