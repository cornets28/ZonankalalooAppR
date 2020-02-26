# frozen_string_literal: true

class ScenesController < ApplicationController
  before_action :set_scene, only: %i[show edit update destroy]
  # before_action :find_serials, only: %i[index show new edit]
  # before_action :authenticate_user!, except: %i[index show]

  def index
    @likes = Like.all
    @scenes = Scene.all.order('created_at desc').paginate(page: params[:page], per_page: 8)
    @scenes_pagination = Scene.paginate(page: params[:page], per_page: 2)
  end

  def show
    @scenes = Scene.all.order('created_at desc')
    Scene.increment_counter(:view, @scene.id)
    @scene.save
  end

  def new
    @scene = current_user.scenes.build
  end

  def edit; end

  def create
    @scene = current_user.scenes.build(scene_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Vous aviez creez cette avec succes!' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
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
      format.html { redirect_to scenes_url, notice: 'Vous aviez supprime cette scene avec succes!' }
      format.json { head :no_content }
    end
  end

  private

  def set_scene
    @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:title, :content, :image, :serial_id)
  end
end
