class RoomsController < ApplicationController
  before_action :require_login
  def show
    @messages = Messages.all
  end
end
