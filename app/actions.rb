# Homepage (Root path)
get '/' do
  erb :index
end

get '/countries' do
  @countries = Country.all
  erb :'countries/index'
end

get 'countries/new' do
  erb :'countries/new'
end

get '/countries/:id' do
  @country = Country.find params[:id]
  erb :'countries/show'
end

post '/countries' do
  @country = Country.new(
    name: params[:name]
  )
  if @country.save
  redirect '/countries'
  else
    erb :'countries/new'
  end
end

get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  @user = User.find_by(username: params[:username], email: params[:email], password: params[:password])

  if @user.save
    session[:user_id] = @user.id
    redirect '/countries/new'
  else
    erb :'auth/login'
  end
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/countries/new'
  else
    erb :'auth/signup'
  end
end