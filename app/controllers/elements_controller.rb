# frozen_string_literal: true

# class of controller
class ElementsController < ApplicationController
  include ElementsHelper

  before_action :set_values, only: :result
  before_action :check_data, only: :result
  before_action :segments_of_powers, only: :result
  before_action :largest_segment, only: :result

  def index; end

  def home; end

  def result
    unless Element.find_by(arr: @str).nil?
      redirect_to '/elements/index', notice: 'There is record with same sequence'
      return
    end
    @element = Element.new do |elem|
      elem.arr = @str
      elem.length = @length
      elem.res_arr = @seg_arr
      elem.max_subarr = @max_subarr
    end
    flash[:warning] = 'Oops! Something happened' unless @element.save
  end
end
