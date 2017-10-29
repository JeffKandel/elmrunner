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
      Http.send SetClothing (Http.get url decodeClothingResponse)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    updateModel msg model
        |> getClothingForModel

updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of
            SetGender selectedGender ->
                ({ model | gender = selectedGender })
            SetIntensity selectedIntensity ->
                ({ model | intensity = selectedIntensity })
            SetFeel selectedFeel ->
                ({ model | feel = selectedFeel })
            SetWeather (Ok weatherData) ->
                ({ model
                 | sunriseMS = weatherData.sys.sunrise
                 , sunsetMS = weatherData.sys.sunset
                 , temp = round weatherData.main.temp
                 , conditionsCode = weatherData.conditionsCode.code
                 }
                )
            SetWeather (Err _) ->
                (model)
            SetClothing (Ok clothingList) ->
                ({ model | clothes = clothingList })
            SetClothing (Err error) ->
                ({ model | error = toString error})

getClothingForModel: Model -> (Model, Cmd Msg)
getClothingForModel model = (model, getClothing model)



