class BoardsController < ApplicationController
before_action :set_board, only: %i(show destroy)

  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
    @user = User.find_by(id: current_user.id)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to :boards
    else
      @board.valid?
      render action: :new
    end
  end

  def show
    @lists = List.where(board_id: params[:id]).includes(:cards)
  end

  def destroy
    @board.destroy
    redirect_to :boards
  end

  private
  def board_params
    params.require(:board).permit(:title, :detail, :user_id).merge(user: current_user)
  end

  def set_board
    @board = Board.find_by(id: params[:id])
  end
end
