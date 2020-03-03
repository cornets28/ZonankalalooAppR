# frozen_string_literal: true

class SerialsController < ApplicationController
  before_action :set_serial, only: %i[show edit update destroy]
  before_action :find_serials, only: %i[index show new edit]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @serials = Serial.all
    @scenes = Scene.all.order('created_at desc')
  end

  def show
    @scenes = Scene.where('serial_id = ?', @serial.id).order('created_at desc')

    # @serials = Serial.all
    @scenes_ch_pagination = Scene.where('serial_id = ?', @serial.id).paginate(page: params[:page], per_page: 3)
  end

  def new
    # @serial = serials
    @serial = Serial.new
  end

  def edit; end

  def create
    @serial = Serial.create(serial_params)
    @serial.user_id = current_user.id
    respond_to do |format|
      if @serial.save
        format.html { redirect_to serials_path, notice: 'La serie a ete creee avec succes!' }
        format.json { render :show, status: :created, location: @serial }
      else
        format.html { render :new }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
 end

  def update
    respond_to do |format|
      if @serial.update(serial_params)
        format.html { redirect_to serials_path, notice: 'La serie a ete modifiee avec succes!' }
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
      format.html { redirect_to serials_url, notice: 'La serie a ete suprimee avec succes!' }
      format.json { head :no_content }
    end
  end

  private

  def set_serial
    @serial = Serial.find(params[:id])
  end

  def find_serials
    @serials = Serial.all.order('created_at desc')
  end

  def serial_params
    params.require(:serial).permit(:mainTitle, :image)
  end
end
