class ApplicationController < ActionController::Base
  # This is to enable searching
  before_action :set_query

  def set_query
    @query = Post.ransack(params[:id])
  end
end
