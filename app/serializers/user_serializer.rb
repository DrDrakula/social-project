class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :posts, :password_digest
end
