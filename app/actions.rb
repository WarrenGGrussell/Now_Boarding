helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def dream_list
    @dream_list ||= User.find(session[:country_id]) if session[:user_id]
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/countries' do
  erb :'countries/index'
end

post '/countries' do
    #Get country from tabcomplete
end

post '/addcountry/:route/:country' do
  if params[:route] == 'future' 
    country = Country.first_or_create(name: params[:country])
    current_user.future_countries.create(country: country)
  elsif params[:route] == 'past'
    country = Country.first_or_create(name: params[:country])
    current_user.past_countries.create(country: country)
  end
end
    


  # @future_countries = @countries.save(
  #   params[:route]
  # )

  # if @future_countries.save
  #   @future_countries = Countries.find(params[:id])
  #   session[:user_id] = @user.id
  #   redirect '/profile'
  # else
  #   erb :'auth/countries'
  # end
# end

### LOGIN & SIGNUP

get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  @user = User.find_by(username: params[:username], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :'auth/login'
  end
end

get '/profile' do
  @current_user = User.find session[:user_id]
  erb :'profile/index'
end

get '/profile/:id' do
  @current_user = User.find(params[:id])
  erb :'profile/index'
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :'auth/signup'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end
