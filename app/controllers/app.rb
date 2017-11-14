
#landing
get '/' do
  erb :"/landing"
end

#index
get '/cars' do
  @cars = Car.all
  erb :"/cars/index"
end

#new
get '/cars/new' do
  erb :"cars/new"
end

#create
post '/cars' do
  Car.create(brand:[params:brand], model:params[:model], img_url: params[:img_url])
end
