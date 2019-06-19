class TopController < ApplicationController
  def index
    @lists = List.where(id: board_id)
  end
end
