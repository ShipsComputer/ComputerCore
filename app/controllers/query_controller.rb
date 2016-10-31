class QueryController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if has_query? && query_present?
      result_hash = Schema.execute(get_query)
      render json: result_hash
    else
      render json: { error: 'No query supplied' }, :status => 404
    end
  end

  private
    def get_query
      params[:query]
    end

    def has_query?
      params.keys.include?('query')
    end

    def query_present?
      params[:query].present?
    end
end
