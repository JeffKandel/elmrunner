module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    {gender: String
    ,intensity: String
    ,feel: String
    ,temp: Int
    ,conditionsCode: Int
    ,windSpeed: Int
    ,sunriseMS: Int
    ,sunsetMS: Int
    ,clothes: List String
    }


init : ( Model, Cmd Msg )
init =
    ( Model
     "female"
     "easy run"
     "in between"
     60
     800
     5
     1493730691000
     1493780370000
     ["Shoes", "Sunblock"]
     , Cmd.none
     )



---- UPDATE ----


type Msg
    = GenMale | GenFem


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            GenMale ->
                ({model | gender = "male"},Cmd.none)
            GenFem ->
                ({model | gender = "female"},Cmd.none)



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

---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
