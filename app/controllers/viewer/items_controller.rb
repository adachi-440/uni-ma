class Viewer::ItemsController < ApplicationController
  def index
    @user = current_user
  end
end
