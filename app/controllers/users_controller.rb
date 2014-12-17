class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @currentUserId = current_user.id
     @user = User.find(@currentUserId)
    @proofs = Proof.where('user_id = ?',@currentUserId)
    @examples = Example.where('user_id = ?',@currentUserId)
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end
