class BooksController < ApplicationController
  get "/books" do
    @books = Book.all
    erb :"books/index"
  end

  get "/books/new" do
    erb :"books/new"
  end

  post "/books" do
    book = Book.new(book_params)
    if book.save
      redirect "/books/#{book.id}"
    else
      flash[:error] = "Couldn't add book"
      redirect "/books/new"
    end
  end

  get "/books/:id" do
    @book = Book.find(params[:id])
    erb :"books/show"
  end

  def book_params
    params.slice("name", "summary", "book_url", "image_url")
  end
end