class FileResourcesController < ApplicationController
  def index
    @file_resources = FileResource.all
  end

  def new
    @file_resource = FileResource.new
  end

  def create
    @file_resource = FileResource.new(file_resource_params)
    if @file_resource.save
      redirect_to file_resources_path, notice: "Arquivo enviado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @file_resource = FileResource.find(params[:id])
  end

  def update
    @file_resource = FileResource.find(params[:id])
    @file_resource.update(file_resource_params)
    redirect_to file_resource_path(@file_resource)
  end

  def destroy
    @file_resource = FileResource.find(params[:id])
    @file_resource.destroy
    redirect_to file_resources_path
  end

  def show 
    @file_resource = FileResource.find(params[:id])
    # send_data @file_resource.file.download, filename: @file_resource.name.to_s
  end

  def download
    @file_resource = FileResource.find(params[:id])
    send_data @file_resource.file.download, filename: @file_resource.name.to_s
  end

  private

  def file_resource_params
    params.require(:file_resource).permit(:name, :file)
  end
end
