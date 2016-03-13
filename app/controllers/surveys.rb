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


# handle if xhr & if errors here
post '/surveys' do
  if !params[:survey][:title].empty?
    @survey = Survey.create(params[:survey])
    erb :'surveys/_new-question', locals: {surveys: @survey}, layout: false
  end
end

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  if session[:user_id] == survey.user_id
    survey.destroy
  end
  redirect "/"

end
