class SublistTypesController < ApplicationController
  before_action :set_sublist_type, only: [:show, :edit, :update, :destroy]

  # GET /sublist_types
  # GET /sublist_types.json
  def index
    @sublist_types = SublistType.all
  end

  # GET /sublist_types/1
  # GET /sublist_types/1.json
  def show
  end

  # GET /sublist_types/new
  def new
    @sublist_type = SublistType.new
  end

  # GET /sublist_types/1/edit
  def edit
  end

  # POST /sublist_types
  # POST /sublist_types.json
  def create
    @sublist_type = SublistType.new(sublist_type_params)

    respond_to do |format|
      if @sublist_type.save
        format.html { redirect_to @sublist_type, notice: 'Sublist type was successfully created.' }
        format.json { render :show, status: :created, location: @sublist_type }
      else
        format.html { render :new }
        format.json { render json: @sublist_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sublist_types/1
  # PATCH/PUT /sublist_types/1.json
  def update
    respond_to do |format|
      if @sublist_type.update(sublist_type_params)
        format.html { redirect_to @sublist_type, notice: 'Sublist type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sublist_type }
      else
        format.html { render :edit }
        format.json { render json: @sublist_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublist_types/1
  # DELETE /sublist_types/1.json
  def destroy
    @sublist_type.destroy
    respond_to do |format|
      format.html { redirect_to sublist_types_url, notice: 'Sublist type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublist_type
      @sublist_type = SublistType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sublist_type_params
      params.require(:sublist_type).permit(:name)
    end
end
