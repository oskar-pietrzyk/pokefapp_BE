# frozen_string_literal: true

module API
  module V1
    module PokemonMasterRanking
      class Base < API::V1::Base
        desc 'Retrun best pokemon players'

        get :pokemon_master_ranking do
          players = {
            players: [
              {
                id: 1,
                player_bio: 'asdf'
              },
              {
                id: 2,
                player_bio: 'asdf'
              },
              {
                id: 3,
                player_bio: 'asdf'
              }
            ]
          }

          render players
        end
      end
    end
  end
end
