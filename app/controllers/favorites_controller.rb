class FavoritesController < ApplicationController
    
  def create
    book = Book.find(params[:book_id])
    # createメソッドとは、引数に渡されたデータを元にモデルのインスタンスを生成して、データベースに保存する
    current_user.favorites.create(book_id: book.id)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end
end
