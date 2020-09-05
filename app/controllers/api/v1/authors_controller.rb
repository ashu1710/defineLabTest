class Api::V1::AuthorsController < ApiController

    #display author details
    def show
        author = Author.friendly.find(params[:id]) rescue nil
        if author.present?
            success_response_with_obj(Api::V1::AuthorsSerializer.new(author).serializable_hash[:data][:attributes])
        else
            error_response_with_obj(
                HTTP_NOT_FOUND[:code],
                I18n.t("#{get_controller}.author_not_found")
            )
        end
    end
end
