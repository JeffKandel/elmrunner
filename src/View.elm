module View exposing (..)

import Model exposing (..)
import Update exposing (Msg(..))

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "container" ] [
        div [ class "left-panel" ] [
            button [ class "btn btn-success", onClick GenMale ] [ text "Male!" ]
            , button [ class "btn btn-success", onClick GenFem ] [ text "Female" ]
        ]
        , div [ class "right-panel" ] [
            div [] [ span [] [ text "Recommended outfit"] ]
            , toHtmlList model.clothes
        ]
    ]

toHtmlList : List String -> Html msg
toHtmlList strings =
  ul [] (List.map toLi strings)

toLi : String -> Html msg
toLi s =
  li [] [ text s ]
