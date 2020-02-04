class PostCommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		comment = current_user.post_commments.new(post_comment_paramas)
		comment.post_image_id = post_image.post.id
		commetnt.save
		redirect_to post_path(post_image)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id,:post_id,:comment)
	end
end
