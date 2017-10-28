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
            input [ type_ "text", placeholder "Location", onInput GetLocation ] []
            ,button [ class "btn btn-success", onClick <| GenderPicked "male" ] [ text "Male!" ]
            , button [ class "btn btn-success", onClick <| GenderPicked "female" ] [ text "Female" ]
            , button [ class "btn btn-success", onClick <| FeelPicked "cool" ] [ text "Cool" ]
            , button [ class "btn btn-success", onClick <| FeelPicked "medium" ] [ text "Medium" ]
            , button [ class "btn btn-success", onClick <| FeelPicked "warm" ] [ text "Warm" ]
            , button [ class "btn btn-success", onClick <| IntensityPicked "easy" ] [ text "Easy" ]
            , button [ class "btn btn-success", onClick <| IntensityPicked "medium" ] [ text "Medium" ]
            , button [ class "btn btn-success", onClick <| IntensityPicked "hard" ] [ text "Hard" ]
            , button [ class "btn btn-success", onClick <| IntensityPicked "race" ] [ text "Race" ]
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
