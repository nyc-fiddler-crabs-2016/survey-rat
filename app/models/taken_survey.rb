class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :choices

  def self.taken?(user_id, survey_id)
    self.find_by(user_id: user_id, survey_id: survey_id)
  end
end
