module Api
  module V2
    class QuotesController < ApplicationController

      def index
        # search = params[:search] 2
        # @quotes = Quote.all.order("author DESC")
        # @quotes = Quote.all.order("author ASC")
        # @quotes = Quote.all.order("id DESC")
        @quotes = Quote.all.order("id ASC")
        # @quotes = Quote.all
        # @quotes = Quote.search(search) 2
        json_response(@quotes)

        # name = params[:name] 3
        # binding.pry 3
        # @quotes = Quote.search(name) 3
        # json_response(@quotes) 3
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