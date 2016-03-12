get '/questions/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end


# Added by J & K
post '/questions' do
  @question = Question.create(params[:question])
  erb :'surveys/_new-possible-choice', locals: {questions: @question}
  , layout: false
end
