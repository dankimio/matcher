json.array! @users do |user|
  json.partial! 'api/users/user', user: user

  friend_request = current_user.friend_requests.find_by(friend: current_user)
  json.matched friend_request.present?

  if friend_request
    json.distance user.distance_to(friend_request.user)
  end
end
