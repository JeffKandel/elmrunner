module View exposing (..)


import Model exposing (..)
import Update exposing (Msg(..))

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
    div [ class "container" ] [
        div [ class "left-panel" ] [
            button [ class "btn btn-success", onClick <| SetGender "male" ] [ text "Male!" ]
            , button [ class "btn btn-success", onClick <| SetGender "female" ] [ text "Female" ]
            , button [ class "btn btn-success", onClick <| SetFeel "cool" ] [ text "Cool" ]
            , button [ class "btn btn-success", onClick <| SetFeel "in between" ] [ text "Medium" ]
            , button [ class "btn btn-success", onClick <| SetFeel "warm" ] [ text "Warm" ]
            , button [ class "btn btn-success", onClick <| SetIntensity "easy run" ] [ text "Easy" ]
            , button [ class "btn btn-success", onClick <| SetIntensity "long run" ] [ text "Long" ]
            , button [ class "btn btn-success", onClick <| SetIntensity "hard workout" ] [ text "Hard" ]
            , button [ class "btn btn-success", onClick <| SetIntensity "race" ] [ text "Race" ]
        ]
        , div [ class "right-panel" ] [
            div [] [ span [] [ text "Recommended outfit for a run in Central Park"] ]
            , toHtmlList model.clothes
        ]
    ]

toHtmlList : List String -> Html msg
toHtmlList strings =
  ul [] (List.map toLi strings)

toLi : String -> Html msg
toLi s =
  li [] [ text s ]
