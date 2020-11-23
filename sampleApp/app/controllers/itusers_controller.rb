class ItusersController < ApplicationController
  before_action :set_ituser, only: [:show, :edit, :update, :destroy]

  # GET /itusers
  # GET /itusers.json
  def index
    @itusers = Ituser.all
  end

  # GET /itusers/1
  # GET /itusers/1.json
  def show
  end

  # GET /itusers/new
  def new
    @ituser = Ituser.new
  end

  # GET /itusers/1/edit
  def edit
  end

  # POST /itusers
  # POST /itusers.json
  def create
    @ituser = Ituser.new(ituser_params)

    respond_to do |format|
      if @ituser.save
        format.html { redirect_to @ituser, notice: 'Ituser was successfully created.' }
        format.json { render :show, status: :created, location: @ituser }
      else
        format.html { render :new }
        format.json { render json: @ituser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itusers/1
  # PATCH/PUT /itusers/1.json
  def update
    respond_to do |format|
      if @ituser.update(ituser_params)
        format.html { redirect_to @ituser, notice: 'Ituser was successfully updated.' }
        format.json { render :show, status: :ok, location: @ituser }
      else
        format.html { render :edit }
        format.json { render json: @ituser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itusers/1
  # DELETE /itusers/1.json
  def destroy
    @ituser.destroy
    respond_to do |format|
      format.html { redirect_to itusers_url, notice: 'Ituser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ituser
      @ituser = Ituser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ituser_params
      params.require(:ituser).permit(:name, :email, :password, :birthday)
    end
end
