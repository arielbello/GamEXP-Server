class ConfsController < ApplicationController
  before_action :set_conf, only: [:show, :edit, :update, :destroy]

  # GET /confs
  # GET /confs.json
  def playtest_conf
    # @conf = Conf.where(game_id: params[:game_id]).sample #take a random Conf of that game
    @conf = find_playtest_conf

    respond_to do |format|
      if @conf
        format.html { redirect_to @conf }
        format.json { render :playtest_conf, status: :ok }
      else
        format.json { render :playtest_conf, status: :not_implemented }
      end
    end
  end

  # GET /confs
  # GET /confs.json
  def index
    @confs = Conf.all
  end

  # GET /confs/1
  # GET /confs/1.json
  def show
  end

  # GET /confs/new
  def new
    @conf = Conf.new
  end

  # GET /confs/1/edit
  def edit
  end

  # POST /confs
  # POST /confs.json
  def create
    @conf = Conf.new(conf_params)
    canSave = true;

    if (request.format == :json)
      if (params[:params].blank?)
        canSave = false;           
        logger.debug "empty parameters"
      else
        params[:params].each do |p|
        @conf.params.new(name: p[:name], value: p[:value])
        end
      end
    end

    respond_to do |format|
      if canSave && @conf.save
        format.html { redirect_to @conf, notice: 'Conf was successfully created.' }
        format.json { render :create, status: :created, location: @conf }
      else
        @conf = nil
        format.html { render :new }
        format.json { render :create, status: :not_implemented }
      end
    end
  end

  # PATCH/PUT /confs/1
  # PATCH/PUT /confs/1.json
  def update
    respond_to do |format|
      if @conf.update(conf_params)
        format.html { redirect_to @conf, notice: 'Conf was successfully updated.' }
        format.json { render :show, status: :ok, location: @conf }
      else
        format.html { render :edit }
        format.json { render json: @conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confs/1
  # DELETE /confs/1.json
  def destroy
    @conf.destroy
    respond_to do |format|
      format.html { redirect_to confs_url, notice: 'Conf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conf
      @conf = Conf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conf_params
      params.require(:conf).permit(:custom, :player_id, :game_id)
    end

    def find_playtest_conf
      lastconfig = Rails.cache.read('LastConfig').to_i
      logger.debug "last config was ... #{lastconfig}"

      whereQuery = "game_id = ? AND (rating >= 0 OR feedback_count < 10)"

      unless (lastconfig.nil?) 
        whereQuery = "id != #{lastconfig} AND game_id = ? AND (rating >= 0 OR feedback_count < 10)"
      end

      conf = Conf.where(whereQuery, params[:game_id]).order(:updated_at).first

      Rails.cache.write('LastConfig', conf.id)

      return conf
    end
end
