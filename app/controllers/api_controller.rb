class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
	include ApiResponseBuilder

  def get_controller
    "app.controllers.api.v1.#{self.controller_name}_controller"
  end

end
