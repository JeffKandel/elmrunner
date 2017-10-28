module Main exposing (..)

import Html exposing (..)
import Model exposing (Model,initialModel)
import Update exposing (update, Msg)
import View exposing (view)

---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = ( initialModel, Cmd.none )
        , update = update
        , subscriptions = always Sub.none
        }
