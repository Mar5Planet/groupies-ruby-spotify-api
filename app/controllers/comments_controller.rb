class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        @fans = Fan.all
        @groups = Group.all
    end

    def create
        @comment = Comment.create(comment_params)

        redirect_to group_path(@comment.group)
    end

    private

    def get_comment
        Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:title, :content, :fan_id, :group_id)
    end

end
