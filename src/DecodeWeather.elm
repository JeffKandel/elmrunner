module DecodeWeather exposing (OpenWeatherResponse, decodeOpenWeatherResponse)

import Json.Decode as Decode exposing (int, string, float, nullable, list, Decoder)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)

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
