class AdminController < ApplicationController
  post "/login" do
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:id] = user.id
      redirect("/")
    else
      flash[:error] = "Invalid username or password"
      redirect "/login"
    end
  end

  get "/login" do
    erb :login
  end

  get "/logout" do
    session[:id] = nil
    redirect("/")
  end
end