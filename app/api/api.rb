class API < Grape::API
  format :json

  mount SocialMusic::Status
end
