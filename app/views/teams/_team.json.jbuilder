json.extract! team, :id, :firstname, :lastname, :position, :facebook_link, :twitter_link, :email, :created_at, :updated_at
json.url team_url(team, format: :json)
