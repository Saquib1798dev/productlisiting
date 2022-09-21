module Api
  module V1
    class ItemsController < ApplicationController
      before_action :get_item, only: [:show]

      def index
        if params[:search]
          search = params[:search].downcase
          @items = FilterItemService.call(search)
        else
          @items = Item.order(" #{sort_column} #{sort_direction} ")
        end
        render json: @items
      end

      def show
        render json: @item
      end

      private 

      def sort_column
        Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?params[:direction]: params[:direction] : "asc"
      end

      def get_item
        @item = Item.find(params[:id])
      end
    end
  end
end
