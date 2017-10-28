module Model exposing (..)

type alias Model =
    { gender: String
    , intensity: String
    , feel: String
    , temp: Int
    , conditionsCode: Int
    , windSpeed: Int
    , sunriseMS: Int
    , sunsetMS: Int
    , clothes: Clothes
    }

initialModel : Model
initialModel =
    { gender = "female"
    , intensity = "easy run"
    , feel = "in between"
    , temp = 60
    , conditionsCode = 800
    , windSpeed = 5
    , sunriseMS = 1493730691000
    , sunsetMS = 1493780370000
    , clothes = ["Shoes", "Sunblock"]
    }

type alias Clothes =
    List String
