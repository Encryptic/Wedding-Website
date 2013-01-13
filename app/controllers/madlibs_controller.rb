class MadlibsController < ApplicationController
  before_filter :auth_required

  def index
    @madlibs = Madlib.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @madlib = Madlib.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end