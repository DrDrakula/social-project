class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user, :created_at, :updated_at
end
