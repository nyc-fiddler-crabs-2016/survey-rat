get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'questions/show'
end

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  if session[:user_id] == survey.user_id
    survey.destroy
  end
  redirect "/"
end
