
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
  Car.create(brand: params[:brand], model:params[:model], img_url: params[:img_url])
end

#show
get '/cars/:id' do
  @car = Car.find(params[:id])
  erb :"cars/show"
end

#edit
get '/cars/:id/edit' do
  @car = Car.find(params[:id])
  erb :"cars/edit"
end

#update
patch '/cars/:id' do
  @car =Car.find(params[:id])
  @car.brand = params[:brand]
  @car.model = params[:model]
  @car.img_url = params[:img_url]
  if @car.save
    redirect "/cars"
  else
    erb :edit
  end
end

#delete
delete '/cars/:id' do
  car = Car.find(params[:id])
  car.destroy
  redirect "/cars"
end
