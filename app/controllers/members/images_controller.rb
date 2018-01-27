class Members::ImagesController < Members::ApplicationController
  before_action :set_observation

  #FIXME 追加処理はまだ対応していない
  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @observation.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @observation.save
    redirect_to :back
  end

  private

  def set_observation
    @observation = Observation.find(params[:observation_id])
  end

  def add_more_images(new_images)
    images = @observation.images
    images += new_images
    @observation.images = images
  end

  def remove_image_at_index(index)
    remain_images = @observation.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @observation.images = remain_images # re-assign back
  end

  def images_params
    params.require(:observation).permit({images: []}) # allow nested params as array
  end
end
