class MembershipsController < ApplicationController
before_filter :authenticate_user!
  def create
    @membership = current_user.memberships.build(:group_id => params[:group_id])
    if @membership.save
      flash[:notice] = "You have joined this group."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
    flash[:notice] = "Removed membership."
        redirect_to :back
  end

  def set_group
    @group = Group.find(params[:id])
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
