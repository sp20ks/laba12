# frozen_string_literal: true

# class of controller
class ElementsController < ApplicationController
  include ElementsHelper
  before_action :set_values, only: :result

  def index; end

  def home; end

  def result
    redirect_to '/elements/index', notice: @element.errors.full_messages.join(' and ') unless @element.save
  end
end
