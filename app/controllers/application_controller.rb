class ApplicationController < Sinatra::Base
  include Configuration

  get '/' do 
    erb :index
  end

  get '/dashboard' do
    @books = Book.all
    @mailing_list = MailingList.all

    erb :dashboard
  end

  # methods that you want to be available in the views and controllers
  helpers do
    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def signed_in?
      !!current_user
    end

    def truncate(text, count)
      "#{text[0..count]}..."
    end
  end
end