# Homepage (Root path)
get '/' do
  erb :index
end

get '/places' do
  @places = Place.all
  erb :'places/index'
end

get 'places/new' do
  erb :'places/new'
end

get '/places/:id' do
  @place = Place.find params[:id]
  erb :'places/show'
end

get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/places/new'
  else
    erb :'auth/login'
  end
end