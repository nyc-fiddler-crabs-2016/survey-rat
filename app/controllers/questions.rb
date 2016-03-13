post "/questions/new/grab" do
  @question = Question.find_by(id: session[:question_id])
  session[:question_id] = nil
  erb :"surveys/_add_question_to_done_questions", layout: false

end

get '/questions/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end

# handle if xhr & if errors here
post '/questions' do
  @question = Question.create(params[:question])
  session[:question_id] = @question.id
  erb :'surveys/_new_choice_original', layout: false
end


