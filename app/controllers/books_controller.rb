class BooksController < ApplicationController
  get "/books" do
    @books = Book.all
    erb :"books/index"
  end

  get "/protected/books/new" do
    @book = Book.new
    erb :"books/new"
  end

  post "/protected/books" do
    @book = Book.new(book_params)
    if @book.save
      redirect "/books/#{@book.id}"
    else
      flash[:error] = "Couldn't add book"
      redirect "/books/new"
    end
  end

  get "/register_download/:id" do
    book = Book.find(params[:id])
    book&.with_lock { book.increment!(:downloads) }
  end

  get "/protected/books/:id/edit" do
    @book = Book.find(params[:id])
    erb :"books/edit"
  end

  patch "/protected/books/:id" do
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect "/books/#{@book.id}"
    else
      flash[:error] = "Couldn't update book"
      redirect "/books/edit"
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