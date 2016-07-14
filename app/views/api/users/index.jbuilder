json.array! @users do |user|
  json.partial! 'api/users/user', user: user
  json.distance user.distance_to(user)
end
