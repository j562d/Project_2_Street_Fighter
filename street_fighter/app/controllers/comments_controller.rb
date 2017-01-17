class CommentsController < ApplicationController


  def show
    @combo = Combo.find(params[:combo_id])
    @comment = Comment.find(params[:id])

  end

  def new
    @comment = Comment.new
    @combo = Combo.find(params[:combo_id])

  end

  def create
    @combo = Combo.find(params[:combo_id])
   # @combo.comments.create(comment_params)
    @comment = @combo.comments.create(comment_params.merge(user_id: current_user.id))
      redirect_to @combo
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to combo_path(@comment.combo_id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to combo_path(@comment.combo_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
