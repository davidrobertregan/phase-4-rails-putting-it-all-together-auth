class UserSerializer < ActiveModel::Serializer
  attributes :id, :password_digest, :image_url, :bio, :username
end
