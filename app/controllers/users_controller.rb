class UsersController < ApplicationController
  # Public: /users Display all Users
  #
  # Render index action
  def index
    @user = User.page(params[:page]).per(5)
  end
  # Public: /users/:id/edit Edit user details
  #
  # Params: user id 
  #
  # Render edit action
	def edit
     @user=User.find(params[:id])
  end
  # Public:PATCH
  #
  # Params: The form params
  #
  # Redirect to question_path
  #
  # Render edit

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to questions_path
    else
      render 'edit'
      flash[:danger]="cannot updated"
    end
  end 
  # Private: user_params - permit parameters
  #
  # Returns nothing
  private
    def user_params
      params.require(:user).permit(:username, :email, :avatar)
    end
end
