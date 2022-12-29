class AdminsController < ApplicationController

  def update1
    @admin = Admin.find_by(id: 3)
    params = comment_params
    @admin.update_attribute(:topic, params[:topic])
    @admin.update_attribute(:text, params[:text])
    @admin.update_attribute(:path, params[:path])
    redirect_to '/'
  end

  def update2
    @admin = Admin.find_by(id: 4)
    params = comment_params
    @admin.update_attribute(:topic, params[:topic])
    @admin.update_attribute(:text, params[:text])
    @admin.update_attribute(:path, params[:path])
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:admin).permit(:topic, :text, :path)
  end
end
