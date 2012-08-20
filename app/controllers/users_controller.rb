class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :edit, :update]

  def index
    @user = User.all
  end

  #go to edit user profile
  def edit
    @user = User.find(params[:id])
  end

  #update user profile
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
