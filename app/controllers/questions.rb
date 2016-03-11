get '/questions/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end

