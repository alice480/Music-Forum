# frozen_string_literal: true

require 'user_check'

class GeneralController < ApplicationController
  def home_page; end

  def profile
    @user = current_user
  end

  def saving_avatar
    @user.photo = params[:file]
    @user.save!
  end
end
