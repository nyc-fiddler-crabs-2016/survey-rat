# created by j & k

post '/possible_choices' do
  @possible_choice = Possible_choice.create(params[:question])
  erb
end
