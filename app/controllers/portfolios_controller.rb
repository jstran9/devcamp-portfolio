class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(check_portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live'}
      else
        form.html { render :new }
      end
    end
  end

  def edit
    set_portfolio
  end

  def update
    set_portfolio
    respond_to do |format|
      if @portfolio_item.update(check_portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record successfully updated."}
      else
        format.html { render :edit}
      end
    end
  end

  def show
    set_portfolio
  end

  private
  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end


  def check_portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
