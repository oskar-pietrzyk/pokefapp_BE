# POKEMON FIGHT APP (POKEFAPP)

## Table of contents

- [General info](#general-info)
- [Tech stack](#tech-stack)
- [Installation](#installation)

## General info

POKEMON FIGHT APP - web turn-based game in the world of pokemon. Gameplay itself is similar to the game like pokemon fire red. The whole application also store our match history, we play pvp via websocket with other players and get higher in the overall ranking, we are winning pokecoins from which we can buy new pokemons (or buy it via stripe with money). Also there is possibility to register via google.

## Tech stack

- Ruby 3.0.1
- Rails 6.1.4
- Postgres 9.6.23

## Installation

1. Clone the repository
  ```shell
  git clone git@github.com:oskar-pietrzyk/pokefapp_BE.git
  ```

2. Set up project locally
- Install gems
  ```shell
  bundle install
  ```

- Set up database
   ```shell
  rails db:setup
  ```

- Run the rails server
  ```shell
  rails s
  ```

## API swagger docs
    
    To checkout api endpoints that require authentication you need to pass access token which you can gain from this:
     
    ```shell
      curl -F grant_type=client_credentials \
      -F client_id=valid_client_id \
      -F client_secret=valid_client_secret \
      -F scope=public \
      -X POST http://localhost:3000/oauth/token
    ```

## Frontend

[Frontend repository with setup](https://github.com/oskar-pietrzyk/pokefapp_fe)
