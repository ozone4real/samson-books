class ApplicationController < Sinatra::Base
  include Configuration

  before "/protected/*" do
    redirect("/") unless signed_in?
  end

  get '/' do 
    erb :index
  end

  get '/protected/dashboard' do
    @books = Book.all
    @mailing_list = MailingList.all
    @total_books_download = Book.sum(:downloads).to_i

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
  end
end