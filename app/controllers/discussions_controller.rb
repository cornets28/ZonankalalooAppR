# frozen_string_literal: true

class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[show edit update destroy]
  before_action :find_channels, only: %i[index show new edit]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @likes = Like.all
    @discussions1 = Discussion.all.order('created_at desc')
    @discussions = Discussion.all.order('created_at desc').paginate(page: params[:page], per_page: 8)
    @discussions_pagination = Discussion.paginate(page: params[:page], per_page: 6)
  end

  def show
    @discussions = Discussion.all.order('created_at desc')
    Discussion.increment_counter(:view, @discussion.id)
    @discussion.save
    # @replies= @discussion.replies
  end

  def new
    @discussion = current_user.discussions.build
  end

  def edit; end

  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def find_channels
    @channels = Channel.all.order('created_at desc')
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content, :image, :channel_id)
  end
end
