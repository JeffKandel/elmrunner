module Main exposing (..)

import Html exposing (..)
import Model exposing (Model,initialModel)
import Update exposing (update, Msg, initialSuggestionsCommand)
import View exposing (view)

---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = ( initialModel, initialSuggestionsCommand )
        , update = update
        , subscriptions = always Sub.none
        }
