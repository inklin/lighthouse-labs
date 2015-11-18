def logged_in?
  session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

get "/" do
  erb :index
end

post "/login" do
  user = User.find_by(email: params[:email], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/songs'
  else
    redirect '/songs?login_error=Invalid email or password'
  end
end

post "/logout" do
  session.clear
  redirect '/songs'
end

get "/signup" do
  @user = User.new
  erb :'login/signup'
end

post "/signup" do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'login/signup'
  end
end

get '/songs' do
  # @songs = Song.joins("LEFT OUTER JOIN 'votes' ON songs.id = votes.song_id").
  #               group('songs.id').order('count(votes.id) DESC')
  @songs = Song.order(votes_count: :desc)
  erb :'songs/index'
end

post '/songs' do
  @song = Song.new(
    title: params[:title], 
    author: params[:author], 
    url: params[:url],
    user_id: current_user.id
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
  @review = Review.new
  @song = Song.find(params[:id])
  erb :'songs/show'
end

post '/votes' do
  song_id = params[:song_id].to_i
  @vote = Vote.new(
    song_id: song_id,
    user_id: current_user.id
  )
  if @vote.save
    redirect '/songs'
  else
    redirect '/songs?vote_error=Cannot vote twice for the same song'
  end
end

post "/reviews" do
  binding.pry
  content = params[:content]
  song_id = params[:song_id].to_i
  rating = params[:rating].to_i
  @review = Review.new(
    song_id: song_id,
    user_id: current_user.id,
    rating: rating,
    content: content
  )
  if @review.save
    redirect "/songs/#{song_id}"
  else
    @song = Song.find(song_id)
    erb :"songs/show"
  end
end

post "/delete-reviews" do
  review_id = params[:review_id]
  song_id = params[:song_id]
  Review.find(review_id).destroy
  redirect "/songs/#{song_id}"
end