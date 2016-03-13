class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  # include BCrypt
  has_many :choices
  has_many :taken_surveys
  has_many :surveys

  def taken_survey_names
    survey_ids = self.taken_surveys.pluck(:survey_id)
    names = survey_ids.map do |survey_id|
      Survey.find(survey_id).title
    end
    names
  end


end
