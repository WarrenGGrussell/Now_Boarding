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