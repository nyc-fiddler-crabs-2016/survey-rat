get "/users" do
  redirect '/users/new'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @surveys = @user.surveys
  @taken_surveys = @user.taken_survey_names
  erb :'/users/show'
end

get '/users/:id/surveys/:id' do
  @user = User.find_by(id: params[:captures][0])
  @survey = Survey.find_by(id: params[:captures][1])
  if @survey.user_id == current_user.id
    @taken_surveys = TakenSurvey.current_survey_collect(@survey.id)
    questions_answers_hash = TakenSurvey.questions_answers_hash(@taken_surveys)
    @all_stats = Survey.all_stats(questions_answers_hash)
    TakenSurvey.all_stats_add_percents(@all_stats)
    erb :"users/surveys/show"
  else
    redirect "/"
  end
end

get '/users/:id/surveys' do
  @surveys = Survey.where(user_id: params[:id])
  erb :'surveys/index'
end
