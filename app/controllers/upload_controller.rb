class UploadController < ApplicationController
  before_filter :auth_required
  
  def index
       
    end
    def create
      post = DataFile.save(params[:picture])
      render :text => "File has been uploaded successfully"
    end
end
