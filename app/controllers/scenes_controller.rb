# frozen_string_literal: true

class ScenesController < ApplicationController
  before_action :set_scene, only: %i[show edit update destroy]
  before_action :find_serials, only: %i[index show new edit create]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_serial, only: %i[new]

  def index
    @likes = Like.all
    @scenes = Scene.all.order('created_at asc')
    # @scenes_pagination = Scene.paginate(page: params[:page], per_page: 2)
  end

  def show
    @scenes = Scene.all.order('created_at asc')
    Scene.increment_counter(:view, @scene.id)
    @scene.save
  end

  def new
    @serials = current_user.serials.all
    @scene = current_user.scenes.build
  end

  def edit; end

  def create
    @serials = current_user.serials.all
    @scene = current_user.scenes.build(scene_params)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to @scene, notice: 'Vous aviez creez cette avec succes!' }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to @scene, notice: 'Vous aviez modifie cette avec succes!' }
        format.json { render :show, status: :ok, location: @scene }
      else
        format.html { render :edit }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to scenes_url, notice: 'Vous aviez supprimez cette scene avec succes!' }
      format.json { head :no_content }
    end
  end

  private

  def set_scene
    @scene = Scene.find(params[:id])
  end

  def find_serials
    @serials = Serial.all.order('created_at desc')
  end

  def set_serial
    @serial = Serial.find_by(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:title, :content, :image, :serial_id)
  end
end
