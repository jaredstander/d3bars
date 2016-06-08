class BarsController < ApplicationController
  def create
    @json_data = json_output(bars_params[:dataset])
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
      format.html
    end
  end

  private

  def bars_params
    params.permit(:dataset)
  end

  def json_output(text_field)
    data_arry = text_field.split(",").map { |x| x.to_i }
    # Because of how hashes are output, leave this to the client side.
    # dataset = []
    # data_arry.each_with_index do |x, i|
    #   dataset.push([i, x])
    # end
    data_arry
  end
end