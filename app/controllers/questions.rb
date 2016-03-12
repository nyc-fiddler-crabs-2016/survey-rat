get '/questions/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end


# Added by J & K
post '/questions' do
  @question = Question.create(params[:question])
end
