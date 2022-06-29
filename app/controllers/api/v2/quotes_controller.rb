module Api
  module V2
    class QuotesController < ApplicationController

      def index
        # @quotes = Quote.all.order("author DESC").paginate(:page => params[:page], :per_page => 5)
        # @quotes = Quote.all.order("author ASC").paginate(:page => params[:page], :per_page => 5)
        # @quotes = Quote.all.order("id DESC").paginate(:page => params[:page], :per_page => 5)
        @quotes = Quote.all.order("id ASC").paginate(:page => params[:page], :per_page => 5)
        json_response(@quotes)

      end

      def show
        @quote = Quote.find(params[:id])
        json_response(@quote)
      end

      def create
        @quote = Quote.create!(quote_params)
        json_response(@quote, :created)
      end

      def update
        @quote = Quote.find(params[:id])
        if @quote.update!(quote_params)
          render status: 200, json: {
            message: "This quote has been updated successfully."
          }
        end
      end

      def destroy
        @quote = Quote.find(params[:id])
        if @quote.destroy!
          render status: 200, json: {
            message: "This quote has been deleted successfully"
          }
        end
      end

      private
      # def json_response(object, status = :ok)
      #   render json: object, status: status
      # end

      def quote_params
        params.permit(:author, :content)
      end
    end
  end
end