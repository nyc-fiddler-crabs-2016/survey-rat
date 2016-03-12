get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

post '/surveys' do
  @survey = Survey.create(params[:survey])
  erb :'surveys/_new-question', locals: {surveys: @survey}, layout: false
end
