module Update exposing (..)

import Model exposing (Model, Clothes)
import DecodeWeather exposing (OpenWeatherResponse, decodeOpenWeatherResponse)
import DecodeClothing exposing (decodeClothingResponse)
import Secrets exposing (openWeatherAPIKey)

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

clothingUrl: String
clothingUrl =
  "/api/female,25,partly%20cloudy,no%20wind,day,race,in%20between"

getClothing : String -> Cmd Msg
getClothing url =
    Http.send SetClothing (Http.get url decodeClothingResponse)

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
                ({ model
                 | sunriseMS = weatherData.sys.sunrise
                 , sunsetMS = weatherData.sys.sunset
                 , temp = round weatherData.main.temp
                 , conditionsCode = weatherData.conditionsCode.code
                 }
                 , Cmd.none
                )
            SetWeather (Err _) ->
                (model, Cmd.none)
            SetClothing (Ok clothingList) ->
                ({ model | clothes = clothingList }, Cmd.none)
            SetClothing (Err error) ->
                ({ model | error = toString error}, Cmd.none)





