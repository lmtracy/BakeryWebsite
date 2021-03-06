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
    subject = 'Ready Baker One Catalog'
    content = Content.new(type: 'text/html', 
    value: '<img src="https://flic.kr/p/26vRfD5"><p><strong>Ready Baker One: Geek Baked Goodies for Sale!</strong>
    <p>Cookies:</p>
    <br>Doctor Who: Lady Cassandra Cookies - $3.50
    <br>Lord of the Rings Cookies - $5.00/2pk
    <br>Aliens Cookies - $2.50
    <p>Cupcakes:</p>
    <br>Marvel Cupcakes - $5.00
    <br>Harry Potter Cupcakes - $5.00
    <br>Star Trek Cupcakes - $5.00
    <p>CakePops:</p>
    <br>Super Mario Pop - $2.50
    <br>Totoro Pop - $2.50
    <br>Star Wars Pop - $2.50
    ')
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    pp response


    redirect "/"

end

get '/thanks' do
    
end
