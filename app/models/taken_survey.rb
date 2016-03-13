class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :choices

  def self.taken?(user_id, survey_id)
    self.find_by(user_id: user_id, survey_id: survey_id)
  end

  def self.current_survey_collect(id)
    self.where(survey_id: id)
  end

  def all_choices
    Choice.all_choices_in_taken_survey(self.id)
  end


  def self.questions_answers_hash(taken_collection)
    choices_hash = {}
    taken_collection.each do |taken_survey|
      taken_survey.all_choices.each do |choice|
        choices_hash[choice.question_id] = [] if choices_hash[choice.question_id].nil?
        choices_hash[choice.question_id] << choice.possible_choice_id
      end
    end
    choices_hash
  end

  def self.all_stats_add_percents(choices_hash)
    choices_hash.each do |question,option_hash|

      total_answers = option_hash.values.reduce(:+)
      option_hash.each do |option,count|
        arr = [count, count / total_answers.to_f]
        choices_hash[question][option] = arr
      end
    end
    choices_hash
  end

end



