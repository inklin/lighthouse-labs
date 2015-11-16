# Homepage (Root path)

def logged_in?
  # change user object into true boolean value
  !!current_user
end

def current_user
  User.find_by(id: cookies[:user_id])
end

get '/' do
  erb :index
end

get '/login' do
  erb :'login/login'
end

post '/login' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)

  if user.password == password
    cookies[:user_id] = user.id
    redirect '/songs'
  else
    @error_message = "Incorrect email or password."
    erb :'/login/login'
  end
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

  if logged_in?
    @user = User.find_by(id: cookies[:user_id])
  end
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
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @other_songs = Song.where('author = ? AND id != ?', @song.author, @song.id)
  erb :'songs/show'
end