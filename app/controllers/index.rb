get '/' do
  @events = Event.all
  erb :index
end

get '/events/:event_id/show_event' do
  @event = Event.find(params[:event_id])
  erb :show_event
end

get '/events/create' do
  @events = Event.all
  erb :create_event
end

post '/events/create' do
  @new_event = Event.create(organizer_name: params[:organizer_name],
                            organizer_email: params[:organizer_email],
                            event_name: params[:event_name],
                            event_date: params[:event_date])
  @errors = @new_event.errors
  if @errors.empty?
    @message = "New event successfully saved!"
  end
  @events = Event.all
  erb :create_event
end

post '/events/:event_id/delete' do
  Event.delete(params[:event_id])
  redirect '/'
end
