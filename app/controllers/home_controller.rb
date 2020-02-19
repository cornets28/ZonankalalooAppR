class HomeController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all.order('created_at desc')
    @teams = Team.all.order('created_at asc')
    @sponsors = Sponsor.all.order('created_at asc')
    @interests = Interest.all.order('created_at asc') 
  end
end


