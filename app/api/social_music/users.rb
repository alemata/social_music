module SocialMusic
  class Users < Grape::API
    resource :users do
      desc "Returns all users"
      get "/" do
        User.all
      end

      post do
        params do
          requires :name, type: String
          optional :listening_to, type: String
          requires :latitude, type: Float
          requires :longitude, type: Float
        end

        User.create(name: params[:name], listening_to: params[:listening_to],
                    latitude: params[:latitude], longitude: params[:longitude])
      end

      route_param :id do
        get :near_users do
          params do
            requires :distance, type: Float
          end
          user = User.find params[:id]
          user.nearbys(params[:distance])
        end
      end
    end
  end
end
