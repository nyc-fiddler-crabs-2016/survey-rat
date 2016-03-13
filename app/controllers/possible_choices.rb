# created by j & k


# handle if xhr & if errors here
post '/possible_choices' do
  # not sure if this is a good idea, but it works:
  @question = Question.last
  @possible_choice = PossibleChoice.create(params[:possible_choice])
  erb :'surveys/_new-possible-choice', layout: false
end


