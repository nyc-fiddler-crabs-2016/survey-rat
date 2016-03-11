post "/takensurveys" do
  TakenSurvey.create(user_id: session[:user_id], survey_id: params[:survey_id])
  redirect '/login'
end
