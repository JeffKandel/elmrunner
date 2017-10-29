module Update exposing (..)

import Model exposing (Model, Clothes)
import DecodeWeather exposing (decodeOpenWeatherResponse, OpenWeatherResponse)
import Secrets exposing (openWeatherAPIKey)

import Http

type Msg
    = GenderPicked String
    | IntensityPicked String
    | FeelPicked String
    | GetWeather (Result Http.Error OpenWeatherResponse)
    | GetClothes

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
    Http.send GetWeather (Http.get url decodeOpenWeatherResponse)

getClothes : Model -> Clothes
getClothes model =
  [toString model.sunriseMS]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            GenderPicked selectedGender ->
                ({ model | gender = selectedGender }, Cmd.none)
            IntensityPicked selectedIntensity ->
                ({ model | intensity = selectedIntensity }, Cmd.none)
            FeelPicked selectedFeel ->
                ({ model | feel = selectedFeel }, Cmd.none)
            GetWeather (Ok weatherData) ->
                { model
                 | sunriseMS = weatherData.sys.sunrise
                 , sunsetMS = weatherData.sys.sunset
                 , temp = round weatherData.main.temp
                 , conditionsCode = weatherData.conditionsCode.code
                }
                |> update GetClothes
            GetWeather (Err _) ->
                (model, Cmd.none)
            GetClothes ->
                ({ model | clothes = getClothes model }, Cmd.none)



