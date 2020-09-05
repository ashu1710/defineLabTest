module ApiResponseBuilder
	HTTP_OK = {code: 200, message: 'success'}
	HTTP_BAD_REQUEST = {code: 400, message: 'Bad Request'}
	HTTP_UNAUTHORIZED = {code: 401, message: 'Invalid Authentication token'}
	HTTP_FORBIDDEN = {code: 403, message: 'Forbidden'}
	HTTP_NOT_FOUND = {code: 404, message: 'Resource Not Found'}
	HTTP_NOT_ACCEPTABLE = {code: 406, message: 'Not acceptable, missing parameters or bad parameters.'}
	HTTP_CONFLICT = {code: 409, message: 'Resource has some conflict with existing data.'}
	HTTP_INTERNAL_SERVER_ERROR = {code: 500, message: 'Internal Server Error'}
	HTTP_SERVICE_UNAVAILABLE = {code: 503, message: 'Service Unavailable'}

	def success_response_with_obj(data_attribute)
		render json: {
			status: HTTP_OK,
			data: data_attribute
		}
	end

	def success_response_with_message(msg, data_attribute)
		render json: {
			status: {
				code: HTTP_OK[:code],
				message: msg
			},
			data: data_attribute
		}
	end

	def success_response_without_obj(message)
		render json: {
			status: {
				code: HTTP_OK[:code],
				message: message
			}
		}
	end

	def error_response_without_obj(status)
		render json: {
			status: status
		}
	end

	def error_response_with_obj(status, data_attribute)
			render json: {
			status: {
				code: status,
				message: data_attribute
			}
		}
	end

	def error_response_with_message_and_obj(message, data_attribute)
		render json: {
			status: {
				code: HTTP_NOT_FOUND[:code],
				message: message
			},
			data: data_attribute
		}
	end
end
