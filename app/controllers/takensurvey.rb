post "/takensurveys" do
  taken = TakenSurvey.create(user_id: session[:user_id], survey_id: params[:survey_id])
  questions = Survey.find(params[:survey_id]).questions.pluck(:id)
  questions.each do |question_id|
    done_choice = Choice.find_by(question_id: question_id, user_id: session[:user_id]).update_attributes(taken_survey_id: taken.id)
  end
  redirect '/surveys'
end
