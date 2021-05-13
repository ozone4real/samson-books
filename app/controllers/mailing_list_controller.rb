class MailingListController < ApplicationController
  post "/mailing_list" do
    MailingList.create(email: params[:email])
    flash[:success] = "You have successfully subscribed to Samson's mailing list"
    redirect("/")
  end

  get "/protected/mailing_list" do
    @mailing_list = MailingList.all
    erb :mailing_list
  end

  delete "/protected/mailing_list/:id" do
    email = MailingList.find(params[:id])
    if email.destroy
      flash[:success] = "#{email} has been deleted."
    else
      flash[:error] = "#{email} couldn't be deleted."
    end

    redirect("/mailing_list")
  end
end