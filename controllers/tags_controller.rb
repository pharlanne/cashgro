require_relative('../models/tag.rb')

get '/tags/new' do
  erb :"tags/new"
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect to('/tags')
end

get '/tags' do
  @tags = Tag.all
  erb :"tags/index"
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb :"tags/edit"
end

post '/tags/:id' do
  puts "params"
  puts params
  @tag = Tag.update(params)
  redirect to("tags/#{params[:id]}")
end

post '/tags/:id/delete' do 
  Tag.destroy(params[:id])
  redirect to("/tags")
end

