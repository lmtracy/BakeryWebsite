require "sinatra"
require "sendgrid-ruby"
require "pp"
include SendGrid


get '/' do
    erb :index
end

get '/cookies' do
    erb :cookies
end

get '/cupcakes' do
    erb :cupcakes
end

get '/cakepops' do
    erb :cakepops
end


post '/form' do
    from = Email.new(email:'lauren.m.tracy@gmail.com')
    to = Email.new(email: params[:email])
    subject = 'Ready Baker One'
    content = Content.new(type: 'text', value: 'Browse our selection')
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    pp response


    redirect "/"

end

get '/thanks' do
    
end
