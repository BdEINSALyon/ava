class VisitorsController < ApplicationController

  def index
    redirect_to members_path unless current_user.nil?
  end

end
