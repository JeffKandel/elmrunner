module Util exposing ( buildKeyFromModel, centralParkWeatherUrl )

import Model exposing ( Model )
import Secrets exposing (openWeatherAPIKey)

buildKeyFromModel: Model -> String
buildKeyFromModel model =
    let
        gender = model.gender
        temp = toString (getRoundedTemp model.temp)
        condition = conditionsFromCode model.conditionsCode
        wind = windFromWindSpeed model.windSpeed
        time = timeOfDay (model.sunriseMS, model.sunsetMS)
        intensity = model.intensity
        feel = model.feel
        list = [gender, temp, condition, wind, time, intensity, feel]
        url = String.join "," list
    in
        url

windFromWindSpeed: Int -> String
windFromWindSpeed speed =
    if speed < 1 then
        "no wind"
    else if speed < 10 then
        "light wind"
    else
        "heavy wind"

getRoundedTemp: Int -> Int
getRoundedTemp temp =
    if temp < -10 then
        -10
    else if temp > 100 then
        100
    else
        temp // 5 * 5

conditionsFromCode: Int -> String
conditionsFromCode code =
    "light rain"


timeOfDay: (Int,Int) -> String
timeOfDay (sunrise,sunset) =
    "day"

centralParkWeatherUrl : String
centralParkWeatherUrl =
    "https://api.openweathermap.org/"
    ++ "data/2.5/weather?lat=40.7829&lon=-73.9654&APPID="
    ++ openWeatherAPIKey
    ++ "&units=imperial"
