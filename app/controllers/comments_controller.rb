class CommentsController < ApplicationController
    def update
      @comment = Comment.find(params[:id])
      
      if @comment.update(comment_params)
        redirect_to root_path(datepicker: @comment.day), notice: 'Comment updated successfully'
      else
        redirect_to root_path(datepicker: @comment.day), alert: 'Failed to update comment'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end