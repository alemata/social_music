class API < Grape::API
  format :json

  mount SocialMusic::Status
  mount SocialMusic::Users
end
