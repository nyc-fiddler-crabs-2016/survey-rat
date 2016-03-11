post '/choices' do
  @possible_choice = PossibleChoice.find(params[:possible_choice_id])
  @question = Question.find(@possible_choice.question_id)
  @survey = Survey.find(@question.survey_id)

  if previous_choice = Choice.has_already_answered?(session[:user_id], @question.id)
    previous_choice.update_attributes(possible_choice_id: @possible_choice.id)
  else
    Choice.create(user_id: session[:user_id], possible_choice_id: @possible_choice.id, question_id: @question.id)
  end
  if Survey.all_questions_answered(@survey.id, session[:user_id])
    erb :'questions/_form_return', layout: false
  end
end
