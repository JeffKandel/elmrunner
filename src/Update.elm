module Update exposing (..)

import Model exposing (Model, Clothes)
import DecodeWeather exposing (OpenWeatherResponse, decodeOpenWeatherResponse)
import DecodeClothing exposing (decodeClothingResponse)
import Util exposing (buildKeyFromModel, centralParkWeatherUrl)

import Http

type Msg
    = SetGender String
    | SetIntensity String
    | SetFeel String
    | SetWeather (Result Http.Error OpenWeatherResponse)
    | SetClothing (Result Http.Error (List String))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            SetGender selectedGender ->
                let
                    updatedModel =
                        { model | gender = selectedGender }
                in
                    ( updatedModel, getClothing updatedModel )
            SetIntensity selectedIntensity ->
                let
                    updatedModel =
                        { model | intensity = selectedIntensity }
                in
                    ( updatedModel, getClothing updatedModel )
            SetFeel selectedFeel ->
                let
                    updatedModel =
                        { model | feel = selectedFeel }
                in
                    ( updatedModel, getClothing updatedModel )
            SetWeather (Ok weatherData) ->
                let
                    updatedModel =
                        { model
                          | sunriseMS = weatherData.sys.sunrise
                          , sunsetMS = weatherData.sys.sunset
                          , temp = round weatherData.main.temp
                          , conditionsCode = weatherData.conditionsCode.code
                        }
                in
                    ( updatedModel, getClothing updatedModel )
            SetWeather (Err _) ->
                (model, Cmd.none)
            SetClothing (Ok clothingList) ->
                ({ model | clothes = clothingList }, Cmd.none)
            SetClothing (Err error) ->
                ( model , Cmd.none)

getWeather : Cmd Msg
getWeather =
  let
    url = centralParkWeatherUrl
  in
    Http.send SetWeather (Http.get url decodeOpenWeatherResponse)

getClothing : Model -> Cmd Msg
getClothing model =
    let
      url = "/api/" ++ buildKeyFromModel model
    in
      Http.send SetClothing (Http.get url decodeClothingResponse)




