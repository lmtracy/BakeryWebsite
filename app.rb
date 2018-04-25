require "sinatra"
require "sendgrid-ruby"

include SendGrid


from = Email.new(email:'lauren.m.tracy@gmail.com')
to = Email.new(email:'lauren.m.tracy@gmail.com')

get '/' do
    erb :form
end

post '/form' do

    subject = '1UP Bakery Catalog'
    content = Content.new(type: 'text', value: params[:comment])
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers

    redirect"/thanks"
end

get '/thanks' do
    "Thank you for your participation"
end
