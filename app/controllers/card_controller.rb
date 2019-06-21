class CardController < ApplicationController
  before_action :set_card, only: %i(show edit update destroy)

  def new
    @card = Card.new
    # includesで@boardを関連でもってこれそう
    @list = List.find_by(id: params[:list_id])  
    @board = Board.find_by(id: @list[:board_id])
  end

  def create
    @card = Card.new(card_params)
    @list = List.find_by(id: params[:list_id])
    if @card.save
      redirect_to board_path(id: @list.board_id)
    else
      @card.valid?
      render action: :new
    end
  end

  def show
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      @card.valid?
      render action: :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  private
  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def set_card
    @card = Card.find_by(id: params[:id])
  end

  # def set_board
  #   @board = Board.find_by(id: params[:id])
  # end

end
