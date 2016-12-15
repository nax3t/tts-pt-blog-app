class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)
		@comment.user = current_user
		@comment.save
		flash[:notice] = "Comment successfully created!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		flash[:notice] = "Comment successfully destroyed!"
		redirect_to @article
		# this is short for: redirect_to article_path(@article)
	end

	private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
