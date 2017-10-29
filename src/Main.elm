module Main exposing (..)

import Html exposing (..)
import Model exposing (Model,initialModel)
import Update exposing (update, Msg, getWeather, getClothing, clothingUrl)
import View exposing (view)

main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = ( initialModel, getWeather)
        , update = update
        , subscriptions = always Sub.none
        }
