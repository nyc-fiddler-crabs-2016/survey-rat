class Survey < ActiveRecord::Base
  validates :title, null: false

  belongs_to :user
  has_many :taken_surveys
  has_many :questions

  def self.all_questions_answered(survey_id, user_id)
    survey = self.find(survey_id)
    questions = survey.questions
    questions.each do |question|
      return false unless Choice.find_by(user_id: user_id, question_id: question.id)
    end
    true
  end

end
