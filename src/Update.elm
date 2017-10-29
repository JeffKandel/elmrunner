module Update exposing (..)

import Model exposing (Model, Clothes)
import DecodeWeather exposing (OpenWeatherResponse, decodeOpenWeatherResponse)
import DecodeClothing exposing (decodeClothingResponse)
import Secrets exposing (openWeatherAPIKey)
import Util exposing (..)

import Http

type Msg
    = SetGender String
    | SetIntensity String
    | SetFeel String
    | SetWeather (Result Http.Error OpenWeatherResponse)
    | SetClothing (Result Http.Error (List String))

centralParkWeatherUrl : String
centralParkWeatherUrl =
    "https://api.openweathermap.org/"
    ++ "data/2.5/weather?lat=40.7829&lon=-73.9654&APPID="
    ++ openWeatherAPIKey
    ++ "&units=imperial"

getWeather : Cmd Msg
getWeather =
  let
    url = centralParkWeatherUrl
  in
    Http.send SetWeather (Http.get url decodeOpenWeatherResponse)

getClothing : Model -> Cmd Msg
getClothing model =
    let
      key = buildKeyFromModel model
      url = "/api/" ++ key
    in
      Http.send SetClothing (Http.get "/api/female,25,partly%20cloudy,no%20wind,day,race,in%20between" decodeClothingResponse)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            SetGender selectedGender ->
                let
                    updatedModel =
                        { model | gender = selectedGender }
                in
                    ( model, getClothing updatedModel )
            SetIntensity selectedIntensity ->
                let
                    updatedModel =
                        { model | intensity = selectedIntensity }
                in
                    ( model, getClothing updatedModel )
            SetFeel selectedFeel ->
                let
                    updatedModel =
                        { model | feel = selectedFeel }
                in
                    ( model, getClothing updatedModel )
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
                    ( model, getClothing updatedModel )
            SetWeather (Err _) ->
                (model, Cmd.none)
            SetClothing (Ok clothingList) ->
                ({ model | clothes = clothingList }, Cmd.none)
            SetClothing (Err error) ->
                ({ model | error = toString error}, Cmd.none)





