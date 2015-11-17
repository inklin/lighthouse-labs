def logged_in?
  session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

get '/' do
  erb :index
end

get '/login' do
  erb :'login/login'
end

post '/login' do
  user = User.find_by(email: params[:email], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/songs'
  else
    @login_error = 'Invalid email or password'
    erb :'login/login'
  end
end

post '/logout' do
  session.clear
  redirect '/songs'
end

get '/signup' do
  @user = User.new
  erb :'login/signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/songs'
  else
    erb :'login/signup'
  end
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

post '/songs' do
  @song = Song.new(
    title: params[:title], 
    author: params[:author], 
    url: params[:url],
    user_id: session[:user_id]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @other_songs = Song.where('author = ? AND id != ?', @song.author, @song.id)
  erb :'songs/show'
end

post '/votes' do
  song_id = params[:song_id].to_i
  @vote = Vote.new(
    song_id: song_id,
    user_id: session[:user_id]
  )
  if @vote.save
    redirect '/songs'
  else
    redirect '/songs?vote_error=Cannot vote twice for the same song'
  end
end