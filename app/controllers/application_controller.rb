class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_company

  def current_company
  	@_current_company ||= session[:current_company_id] &&
      Company.find_by(id: session[:current_company_id])
  end

  private

  def set_company
  	session[:current_company_id] ||= 1
  end
end
