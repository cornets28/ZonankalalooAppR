# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new
    @like.user = current_user
    @like.discussion = Discussion.find(params[:id])
    @like.save
    @status = params[:status]
    if @status == 'show'
      redirect_to discussion_path(params[:id])
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.likes.each do |like|
      like.destroy if like.discussion_id == params[:id].to_i
    end
    if @status == 'show'
      redirect_to discussion_path(params[:id])
    else
      redirect_back(fallback_location: root_path)
    end
  end
  end
