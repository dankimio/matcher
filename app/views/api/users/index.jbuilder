json.array! @users do |user|
  json.partial! 'api/users/user', user: user

  friend_request = @friend_requests.find { |friend_request| friend_request.friend == current_user }
  json.matched friend_request.present?

  if friend_request
    json.distance user.distance_to(friend_request.user)
  end
end
