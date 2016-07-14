json.partial! 'api/users/user', user: @user
json.extract! @user, :api_token
