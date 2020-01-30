require("sinatra")
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/student.rb')
also_reload('.models/*')

get '/home' do
  erb(:home)
end

get '/home/index' do

  @students = Student.all()
  erb(:index)
end

get '/home/index/new' do
  erb(:new)
end

get '/home/index/:id'do
@student = Student.find_by_id(params[:id])
erb(:student)
end

get 'home/houses' do
  @house = House.all
  erb(:houses)
end

post '/home/index' do
  @student = Student.new(params)
  @student.save()
  redirect to '/home/index'
end
binding.pry
Student.house(0)
