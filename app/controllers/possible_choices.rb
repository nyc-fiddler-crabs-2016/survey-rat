post '/possible_choices' do
  @question = Question.find_by(id: session[:question_id])
  @possible_choice = PossibleChoice.create(params[:possible_choice])
  @possible_choices = @question.possible_choices
  erb :'surveys/_new-possible-choice_submitted', layout: false
end

post '/possible_choices/new' do

  @question = Question.find_by(id: session[:question_id])
  @possible_choice = PossibleChoice.create(params[:possible_choice])
  @possible_choices = @question.possible_choices
  erb :'surveys/_new-possible-choice_submitted', layout: false
end
