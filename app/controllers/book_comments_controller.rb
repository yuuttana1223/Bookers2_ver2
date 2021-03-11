class BookCommentsController < ApplicationController
  def create
    book_comment = current_user.book_comments.new(book_comment_params)
    book = Book.find(params[:book_id])
    book_comment.book_id = book.id
    book_comment.save
    redirect_to book_path(book.id)
  end

  def destroy
    book_comment = BookComment.find_by(id: params[:book_id], book_id: params[:id])
    book_comment.destroy
    redirect_to book_path(book_comment.book_id)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
