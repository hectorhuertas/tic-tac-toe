class GameSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.adapter = :json

  attributes :id, :size
end
