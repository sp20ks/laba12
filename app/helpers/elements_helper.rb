# frozen_string_literal: true

# helper
module ElementsHelper
  def set_values
    if user_signed_in?
      @element = Element.new do |elem|
        elem.arr = params[:str_elem]
        elem.length = params[:length].to_i
      end
    else
      redirect_to new_us_path, notice: 'Adding a sequence is not possible without authorization'
    end
  end
end
