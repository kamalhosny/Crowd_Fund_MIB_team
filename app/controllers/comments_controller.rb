class CommentsController < ApplicationController
  def index
    comments = Comment.where campaign_id: params[:campaign_id]
    respond_to do |format|
      format.json {render json: comments}
    end
  end

  def create
    comment = current_user.comments.create comment_params.merge({username: current_user.username})
    respond_to do |format|
      if comment.errors.empty?
          format.json {render :json =>comment}
      else
        format.json {render json: comment.errors.full_messages, status: 400 }
      end
    end
  end

  def update
    comment = Comment.find params[:id]
    if current_user.comments.include? comment || current_admin
      respond_to do |format|
        if (current_user.comments.include? comment || current_admin) && (comment.update! comment_params)
            format.json {render :json =>comment}
        else
          format.json {render json: comment.errors.full_messages, status: 400}
        end
      end
    end
  end

  def destroy
    comment = Comment.find params[:id]
    respond_to do |format|
      if (current_user.comments.include? comment || current_admin) && (comment.delete)
        format.json {render json: {message: "comment: '#{params[:id]}' deleted"}, status: 200}
      else
        format.json {render json: comment.errors.full_messages, status: 400}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:campaign_id)
  end

end
