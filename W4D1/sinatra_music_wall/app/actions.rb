# Available methods
helpers do

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def handle_errors
    @errors = session[:error] if session[:error]
    session[:error] = nil
  end

  def can_vote?(user_id, song_id)
    Vote.where("user_id = ? AND song_id = ?", user_id, song_id).empty?
  end

end

before do
  current_user
  handle_errors
end

# Homepage
get "/" do
  erb :index
end

# Sign up
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

# Login
post "/login" do
  user = User.find_by(email: params[:email], password: params[:password])
  if user
    session[:user_id] = user.id
  else
    session[:error] = "Invalid email or password"
  end
  redirect '/songs'
end

get "/logout" do
  session.clear
  redirect '/songs'
end

# All songs
get '/songs' do
  @songs = Song.order(votes_count: :desc)
  erb :'songs/index'
end

# Vote for songs
post '/songs' do
  @song = Song.find(params[:song_id])
  @vote = @song.votes.new(
    user_id: session[:user_id]
  )
  if @vote.save
    redirect '/songs'
  else
    session[:error] = "Cannot vote for the same song twice"
    redirect '/songs'
  end
end

# New song form
get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs/new' do
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

# Instance of song
get '/songs/:id' do
  @review = Review.new
  @song = Song.find(params[:id])
  erb :'songs/show'
end

# Review a song
post "/songs/:id" do
  content = params[:content]
  rating = params[:rating].to_i
  song_id = params[:id].to_i
  @song = Song.find(song_id)
  @review = @song.reviews.new(
    user_id: session[:user_id],
    rating: rating,
    content: content
  )
  if @review.save
    redirect "/songs/#{song_id}"
  else
    @error = "Comment must be at least 10 characters long."
    @review = Review.new(content: content)
    @song = Song.find(song_id)
    erb :"songs/show"
  end
end

delete "/songs/:id/reviews/delete" do
  review_id = params[:review_id]
  song_id = params[:song_id]
  Review.find(review_id).destroy
  redirect "/songs/#{song_id}"
end