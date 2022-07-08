module Authenticable
  extend ActiveSupport::Concern

  FACEBOOK_FIELDS = ['id', 'first_name', 'last_name', 'gender', 'picture.type(large)'].freeze

  module ClassMethods
    def find_or_initialize_by_facebook(graph)
      facebook_user = graph.get_object('me', fields: FACEBOOK_FIELDS)
      user = find_by(facebook_id: facebook_user['id'])

      user || new(
        first_name: facebook_user['first_name'], last_name: facebook_user['last_name'],
        gender: facebook_user['gender'], facebook_id: facebook_user['id'],
        remote_avatar_url: facebook_user.dig('picture', 'data', 'url').to_s
      )
    end
  end
end
