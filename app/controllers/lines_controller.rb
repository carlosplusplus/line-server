class LinesController < ApplicationController
  def show
    # TODO: Implement caching / decompression mechanism based on ID.
    # TODO: Render 413 is cache access is a miss.
    render json: { text: 'Pull from Cache based on ID' }, status: 200
  end
end
