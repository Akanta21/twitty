class CommentsController < ApplicationController
  before_action :authenticate_user
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user_id
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to user_post_path(@user, @post), notice: "Successfully created!"
  end

  def destroy
      @post = Post.find(params[:post_id])
      @user = @post.user_id
      @comment = Comment.find(params[:id])
      if @comment.user_id.to_i == current_user.id.to_i
        @comment.destroy
      redirect_to user_post_path(@user, @post),notice: "Successfully deleted!"
      else
      redirect_to user_post_path(@user, @post),notice: "Not deleted!"
  end
end

end
