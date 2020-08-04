class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      redirect_to comment.post
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :event_id, :user_id, user_attributes:[:name])
    end
  end
  