<<<<<<< HEAD
get '/questions/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end


# Added by J & K
# handle if xhr & if errors here
post '/questions' do
  @question = Question.create(params[:question])
  erb :'surveys/_new-possible-choice', layout: false
end
