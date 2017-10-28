module Update exposing (..)

import Model exposing (Model, Weather, Times, Clothes)
import Http
import Json.Decode as Decode
import Secrets exposing (openWeatherAPIKey)


-- API request URLs


api : String
api =
    "https://api.openweathermap.org/"


centralParkWeatherUrl : String
centralParkWeatherUrl =
    api
    ++ "data/2.5/weather?lat=40.7829&lon=73.9654&APPID="
    ++ openWeatherAPIKey
    ++ "89b51f79ad8a8998f6d112c907a9a815&units=imperial"

-- GET a random quote (unauthenticated)


getWeather : String -> Cmd Msg
getWeather topic =
  let
    url = centralParkWeatherUrl
  in
    Http.send GetWeather (Http.get url decodeWeatherInfo)


decodeWeatherInfo : Decode.Decoder (Weather, Times)
decodeWeatherInfo =
  Decode.at ["data", "image_url"] Decode.list

type Msg
    = GenderPicked String
    | IntensityPicked String
    | FeelPicked String
    | GetWeather (Result Http.Error String)
    | GetClothes Clothes

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            GenderPicked selectedGender ->
                ({ model | gender = selectedGender }, Cmd.none)
            IntensityPicked selectedIntensity ->
                ({ model | intensity = selectedIntensity }, Cmd.none)
            FeelPicked selectedFeel ->
                ({ model | feel = selectedFeel }, Cmd.none)
            GetWeather (Ok (newWeather, newTimes)) ->
                ( { model | weather = newWeather, times = newTimes }, Cmd.none)
            GetWeather (Err _) ->
                (model, Cmd.none)
            GetClothes clothes ->
                ({ model | clothes = clothes }, Cmd.none)


