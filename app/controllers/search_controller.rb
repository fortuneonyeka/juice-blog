class SearchController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @query = Article.ransack(params[:q])
    @articles = @query.result(distinct: true)
    @searches = @query.result
  end
end
