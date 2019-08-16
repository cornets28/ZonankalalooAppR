class HomeController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all.order('created_at desc')
  end
end
