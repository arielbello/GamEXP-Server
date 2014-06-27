class ParamsController < ApplicationController
  before_action :set_param, only: [:show, :edit, :update, :destroy]

  # GET /params
  # GET /params.json
  def index
    @conf = Conf.find(params[:conf_id])
    @params = @conf.params
  end

  # GET /params/1
  # GET /params/1.json
  def show
  end

  # GET /params/new
  def new
    @conf = Conf.find(params[:conf_id])
    @param = @conf.params.new
  end

  # GET /params/1/edit
  def edit

  end

  # POST /params
  # POST /params.json
  def create
    @conf = Conf.find(params[:conf_id])
    @param = @conf.params.new(param_params)

    respond_to do |format|
      if @param.save
        format.html { redirect_to conf_param_path(@conf, @param), notice: 'Param was successfully created.' }
        format.json { render :show, status: :created, location: @param }
      else
        format.html { render :new }
        format.json { render json: @param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /params/1
  # PATCH/PUT /params/1.json
  def update
    respond_to do |format|
      if @param.update(param_params)
        format.html { redirect_to @param, notice: 'Param was successfully updated.' }
        format.json { render :show, status: :ok, location: @param }
      else
        format.html { render :edit }
        format.json { render json: @param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /params/1
  # DELETE /params/1.json
  def destroy
    @param.destroy
    respond_to do |format|
      format.html { redirect_to params_url, notice: 'Param was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_param
      @conf = Conf.find(params[:conf_id])
      @param = @conf.params.find(params[:id])
      # @param = Param.where(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def param_params
      params.require(:param).permit(:name, :value, :conf_id)
    end
end
