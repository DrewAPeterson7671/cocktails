class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[ show edit update destroy ]

  # GET /cocktails or /cocktails.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1 or /cocktails/1.json
  def show
    @user = User.find(params[:user_id])
    @cocktail = Cocktail.find(params[:id])
    render :show
  end

  # GET /cocktails/new
  def new
    @user = User.find(params[:user_id])
    @cocktail = @user.cocktails.new
    render :new
  end

  # GET /cocktails/1/edit
  def edit
    @user = User.find(params[:user_id])
    @cocktail = Cocktail.find(params[:id])
    render :edit
  end

  # POST /cocktails or /cocktails.json
  def create
    @user = User.find(params[:user_id])
    @cocktail = @user.cocktails.new(cocktail_params)
    if @cocktail.save
      redirect_to user_path(@user)
    else
      render :new
    end
  
  end

  # PATCH/PUT /cocktails/1 or /cocktails/1.json
  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to user_path(@cocktail.user)
    else
      @user = User.find(params[:user_id])
      render :edit
    end

  end

  # DELETE /cocktails/1 or /cocktails/1.json
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to user_path(@cocktail.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :ingredients)
    end
end
