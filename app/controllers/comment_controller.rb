class CommentController < ApplicationController
  def index
    # @comments = Comment.where(post_id: current_user.post).all.order()
  end

  def new
    @comment = Comment.new
  end

  def create

  end
end

private

def post_params
  params.require(:comment).permit(:content, :post_id)
end
