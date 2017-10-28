module Update exposing (..)

import Model exposing (Model, Clothes)
import Secrets exposing (openWeatherAPIKey)

import Http
import Json.Decode as Decode exposing (int, string, float, nullable, list, Decoder)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)

-- API request URLs

api : String
api =
    "https://api.openweathermap.org/"


centralParkWeatherUrl : String
centralParkWeatherUrl =
    api
    ++ "data/2.5/weather?lat=40.7829&lon=-73.9654&APPID="
    ++ openWeatherAPIKey
    ++ "&units=imperial"

-- GET a random quote (unauthenticated)
getClothes : Model -> Clothes
getClothes model =
  [toString model.sunriseMS]


getWeather : Cmd Msg
getWeather =
  let
    url = centralParkWeatherUrl
  in
    Http.send GetWeather (Http.get url decodeOpenWeatherResponse)

type alias OpenWeatherResponse =
  { main: MainResult
  , sys : SysResult
  , wind : WindResult
  , conditionsCode: ConditionResult
  }

type alias MainResult =
  { temp: Float }

type alias SysResult =
  { sunrise: Int
  , sunset: Int
  }

type alias WindResult =
  { speed: Float }

type alias ConditionResult =
  { code: Int }



decodeOpenWeatherResponse : Decoder OpenWeatherResponse
decodeOpenWeatherResponse =
    decode OpenWeatherResponse
        |> required "main" decodeMain
        |> required "sys" decodeSys
        |> required "wind" decodeWind
        |> required "weather" decodeConditions

decodeSys : Decoder SysResult
decodeSys =
    decode SysResult
        |> required "sunrise" int
        |> required "sunset" int

decodeMain : Decoder MainResult
decodeMain =
    decode MainResult
        |> required "temp" float

decodeWind : Decoder WindResult
decodeWind =
    decode WindResult
        |> required "speed" float

decodeConditions : Decoder ConditionResult
decodeConditions =
     decode ConditionResult
        |> required "id" int
        |> Decode.index 0



type Msg
    = GenderPicked String
    | IntensityPicked String
    | FeelPicked String
    | GetWeather (Result Http.Error OpenWeatherResponse)
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
            GetWeather (Ok weatherData) ->
                { model
                 | sunriseMS = weatherData.sys.sunrise
                 , sunsetMS = weatherData.sys.sunset
                 , temp = round weatherData.main.temp
                 , conditionsCode = weatherData.conditionsCode.code
                 , clothes = getClothes model
                }
                |> update (GetClothes (getClothes) )

            GetWeather (Err _) ->
                (model, Cmd.none)
            GetClothes clothes ->
                ({ model | clothes = clothes }, Cmd.none)


