class Survey < ActiveRecord::Base
  validates :title, null: false, presence: true

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

  def self.all_stats(all_choices_hash)
    all_stats = {}
    all_choices_hash.each do |question_id, question_response_arr|
      data_stats = Hash.new(0)
      question_response_arr.each do |option_id|
        data_stats[PossibleChoice.find(option_id).option] += 1
      end
      all_stats[Question.find(question_id).content] = data_stats
    end
    all_stats
  end

end
