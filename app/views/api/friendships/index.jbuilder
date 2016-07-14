json.array! @friendships do |friendship|
  json.partial! 'api/friendships/friendship', friendship: friendship

  json.friend do
    json.partial! 'api/users/user', user: friendship.friend
  end
end
