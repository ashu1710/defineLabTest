class Api::V1::BooksSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :slug
end
