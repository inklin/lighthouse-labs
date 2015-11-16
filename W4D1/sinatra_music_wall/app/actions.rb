# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

post '/songs' do
  @song = Song.new(
    title: params[:title], 
    author: params[:author], 
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/new' do
  erb :'songs/new'
end