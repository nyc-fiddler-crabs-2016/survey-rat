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
  erb :'/users/show'
end

get '/users/:id/surveys/:id' do
  @user = User.find_by(id: params[:captures][0])
  @survey = Survey.find_by(id: params[:captures][1])
  if @survey.user_id == current_user.id
    @taken_surveys = TakenSurvey.where(survey_id: @survey.id)
    @choices = {}
    @taken_surveys.each do |taken_survey|
      Choice.where(taken_survey_id: taken_survey.id).each do |choice|
        if @choices[choice.question_id].nil?
          @choices[choice.question_id] = []
        end
        @choices[choice.question_id] << choice.possible_choice_id
      end
    end

    erb :"users/surveys/show"
  else
    redirect "/"
  end
end

get '/users/:id/surveys' do
  @surveys = Survey.where(user_id: params[:id])
  erb :'surveys/index'
end
