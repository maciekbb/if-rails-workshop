class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)

		if @comment.save
			respond_to do |format|
				format.html { redirect_to @post }
				format.js
			end
		else
			raise "Something went wrong"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html { redirect_to @comment.post }
			format.js
		end
	end


	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
