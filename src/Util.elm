module Util exposing (..)

import Model exposing (Model)

buildKeyFromModel: Model -> String
buildKeyFromModel model =
    let
        baseUrl = "25,partly%20cloudy,no%20wind,day,race,in%20between"
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

conditionsFromCode: Int -> String
conditionsFromCode code =
    "light rain"

timeOfDay: (Int,Int) -> String
timeOfDay (sunrise,sunset) =
    "dawn"

getRoundedTemp: Int -> Int
getRoundedTemp temp =
    if temp < -10 then
        -10
    else if temp > 100 then
        100
    else
        temp // 5 * 5
