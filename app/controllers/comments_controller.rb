class CommentsController < ApplicationController
    before_action :current_user 

    def create
      @user = current_user
      comment = Comment.create(comment_params)
      comment.user = current_user
      if comment.save
        redirect_to comment.event
      else
        render '/events/show'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :event_id, :user_id, user_attributes:[:id])
    end
  end
  