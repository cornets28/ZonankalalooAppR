# frozen_string_literal: true

class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[show edit update destroy]

  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  def show
    @discussions = Discussion.where('channel_id = ?', @channel.id).order('created_at desc')
    @channels = Channel.all
    @discussions_ch_pagination = Discussion.where('channel_id = ?', @channel.id).paginate(page: params[:page], per_page: 9)
  end

  def new
    @channel = Channel.new
  end

  def edit; end

  def create
    @channel = Channel.new(channel_params)
    # discussion_id = DELETE
    # @channel = Channel.new(discussion_id)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_path, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
 end

  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channels_path, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:channel)
  end
end
