module Update exposing (..)

import Model exposing (Model, Clothes)
import DecodeWeather exposing (OpenWeatherResponse, decodeOpenWeatherResponse)
import DecodeClothing exposing (ClothingResponse, decodeClothingResponse)
import Secrets exposing (openWeatherAPIKey)

import Http

type Msg
    = SetGender String
    | SetIntensity String
    | SetFeel String
    | SetWeather (Result Http.Error OpenWeatherResponse)
    | SetClothing (Result Http.Error ClothingResponse)
    | SetClothes

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

clothingUrl: String
clothingUrl =
  "./clothing.json"

getClothingDict : Cmd Msg
getClothingDict =
  let
    url = clothingUrl
  in
    Http.send SetClothing (Http.get url decodeClothingResponse)

setClothes : Model -> Clothes
setClothes model =
  [toString model.sunriseMS]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            SetGender selectedGender ->
                ({ model | gender = selectedGender }, Cmd.none)
            SetIntensity selectedIntensity ->
                ({ model | intensity = selectedIntensity }, Cmd.none)
            SetFeel selectedFeel ->
                ({ model | feel = selectedFeel }, Cmd.none)
            SetWeather (Ok weatherData) ->
                { model
                 | sunriseMS = weatherData.sys.sunrise
                 , sunsetMS = weatherData.sys.sunset
                 , temp = round weatherData.main.temp
                 , conditionsCode = weatherData.conditionsCode.code
                }
                |> update SetClothes
            SetWeather (Err _) ->
                (model, Cmd.none)
            SetClothing (Ok clothingData) ->
                ({ model | clothingDict = clothingData.clothingOptions }, Cmd.none)
            SetClothing (Err _) ->
                (model, Cmd.none)
            SetClothes ->
                ({ model | clothes = setClothes model }, Cmd.none)



