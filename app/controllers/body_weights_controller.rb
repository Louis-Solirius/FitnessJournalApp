class BodyWeightsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_body_weight, only: %i[ show edit update destroy ] 
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /body_weights or /body_weights.json
  def index
    @body_weights = BodyWeight.all
    @body_weight = BodyWeight.new
  end

  # GET /body_weights/1 or /body_weights/1.json
  def show
  end

  # GET /body_weights/new
  def new
    #@body_weight = BodyWeight.new
    @body_weight = current_user.body_weights.build
  end

  # GET /body_weights/1/edit
  def edit
  end

  # POST /body_weights or /body_weights.json
  def create
    #@body_weight = BodyWeight.new(body_weight_params)
    @body_weight = current_user.body_weights.build(body_weight_params)

    respond_to do |format|
      if @body_weight.save
        format.html { redirect_to body_weights_path, notice: "Weight added." }
        format.json { render :index, status: :created, location: @body_weight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @body_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /body_weights/1 or /body_weights/1.json
  def update
    respond_to do |format|
      if @body_weight.update(body_weight_params)
        format.html { redirect_to body_weight_url(@body_weight), notice: "Body weight was successfully updated." }
        format.json { render :show, status: :ok, location: @body_weight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @body_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_weights/1 or /body_weights/1.json
  def destroy
    @body_weight.destroy!

    respond_to do |format|
      format.html { redirect_to body_weights_url, notice: "Weight deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @body_weight = current_user.body_weights.find_by(id: params[:id])
    redirect_to body_weights_path, notice: "Not Authorised to view or edit this body weight" if @body_weight.nil?
  end

  def remove_all
    current_user.body_weights.delete_all
    flash[:notice] = "All Weights Deleted"
    redirect_to body_weights_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_weight
      @body_weight = BodyWeight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def body_weight_params
      params.require(:body_weight).permit(:date, :weight, :user_id)
    end
end
