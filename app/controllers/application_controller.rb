class ApplicationController < ActionController::Base
  before_action :load_categories
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def load_categories
    @categories = Category.all
  end
end
