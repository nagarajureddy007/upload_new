class ApplicationController < ActionController::Base 

  protect_from_forgery
  # before_filter :authenticate_user!, :except => [:show, :index] #device
  after_filter :set_header_for_iframe

  def set_header_for_iframe

  end
end
