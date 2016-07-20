json.cache! user do
  json.extract! user,
                :id, :first_name, :last_name, :birthdate,
                :avatar_url, :gender, :team, :bio,
                :checked_in_at, :created_at
end
