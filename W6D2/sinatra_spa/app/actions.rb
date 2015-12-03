# Homepage (Root path)
get '/' do
  erb :index
end

# Read
get '/contacts' do
  Contact.all.to_json
end

get '/contacts/:id' do
  @contact = Contact.find(:id)
  if @contact
    @contact.to_json
  else
    status 404
  end
end

# Search
get '/contacts/search' do
  if params[:search]
    Contact.search(params[:search]).to_json
  end
end

# Create Contact
post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    @contact.to_json
  else
    @contact.errors.full_messages.to_json
  end
end

# Update Contact
put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact.update(request.params['contact'])
    puts "Success"
  end
end

# Delete
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact
    @contact.destroy
  else
    status 404
  end
end