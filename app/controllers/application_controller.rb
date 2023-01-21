class ApplicationController < ActionController::Base

  before_action :set_query

  def set_query
    @query = Article.ransack(params[:q])
    @article = @query.result(distinct: true)
  end
end
