class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.username = params[:username]
    comment.email = params[:email]
    comment.content = params[:content]
    comment.issue_id = params[:issue_id]
    comment.save
    redirect_to comment.issue
  end
end
