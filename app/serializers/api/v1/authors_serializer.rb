class Api::V1::AuthorsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :slug

  attributes :books do |object|
    Api::V1::BooksSerializer.new(object.books).serializable_hash[:data].map{|data| data[:attributes]}
  end

end
