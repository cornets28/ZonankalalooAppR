class SerialsController < ApplicationController
  before_action :set_serial, only: %i[show edit update destroy]

  def index
    @serials = Serial.all
    @scenes = Scenes.all.order('created_at desc')
  end

  def show
    @scenes = Scene.where('serial_id = ?', @serial.id).order('created_at desc')
    @serials = Serial.all
    @scenes_ch_pagination = Scene.where('serial_id = ?', @serial.id).paginate(page: params[:page], per_page: 2)
  end

  def new
    @serial = Serial.new
  end

  def edit
  end

  def create
    @serial = Serial.new(serial_params)

    respond_to do |format|
      if @serial.save
        format.html { redirect_to @serial, notice: 'Vouz venez tout just de creer une nouvelles serie!' }
        format.json { render :show, status: :created, location: @serial }
      else
        format.html { render :new }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serials/1
  # PATCH/PUT /serials/1.json
  def update
    respond_to do |format|
      if @serial.update(serial_params)
        format.html { redirect_to @serial, notice: 'Cette a ete modifye avec succes!' }
        format.json { render :show, status: :ok, location: @serial }
      else
        format.html { render :edit }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @serial.destroy
    respond_to do |format|
      format.html { redirect_to serials_url, notice: 'Vous aviez suprimer cette series avec succes!' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_serial
      @serial = Serial.find(params[:id])
    end

    def serial_params
      params.require(:serial).permit(:mainTitle)
    end
end
