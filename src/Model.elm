module Model exposing (..)

type alias Model =
    { gender: String
    , intensity: String
    , feel: String
    , weather: Weather
    , times: Times
    , clothes: List String
    }


initialWeather : Weather
initialWeather =
    { temp = 60
    , conditionsCode = 800
    , windSpeed = 5
    }

initialTimes : Times
initialTimes =
    { sunriseMS = 1493730691000
    , sunsetMS = 1493780370000
    }

initialModel : Model
initialModel =
    { gender = "female"
    , intensity = "easy run"
    , feel = "in between"
    , weather = initialWeather
    , times = initialTimes
    , clothes = ["Shoes", "Sunblock"]
    }

type alias Weather =
    { temp: Int
    , conditionsCode: Int
    , windSpeed: Int
    }

type alias Times =
    { sunriseMS: Int
    , sunsetMS: Int
    }

type alias Clothes =
    List String
