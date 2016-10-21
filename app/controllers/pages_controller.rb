class PagesController < ApplicationController
  def show
    if user_signed_in?
      @get_started_link = fridges_path
      @logo_link = fridges_path
    else
      @get_started_link = new_user_session_path
      @logo_link = root_path
    end

    render template: "pages/#{params[:page]}"
  end
end
