get '/' do
  # Look in app/views/index.erb
  @notes = Note.all
  erb :index
end

post '/' do
  note = Note.find_or_create_by_title(title: params[:title], content: params[:content])

  redirect '/'

end

get '/note/:id' do
  @note = Note.find(params[:id])
  erb :note
end

post '/update/:id' do 
  note = Note.find(params[:id])
  note.update_attributes(title: params[:title], content: params[:content])

  redirect '/'
end


post '/delete/:id' do
  Note.find(params[:id]).destroy

  redirect '/'

end


