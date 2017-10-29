module Model exposing (..)

import Dict exposing (..)

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
    , clothingDict: ClothingDict
    , error: String
    }

initialModel : Model
initialModel =
    { gender = "female"
    , intensity = "easy run"
    , feel = "in between"
    , temp = 60
    , conditionsCode = 800
    , windSpeed = 5
    , sunriseMS = 4
    , sunsetMS = 3
    , clothes = ["Shoes", "Sunblock"]
    , clothingDict = Dict.empty
    , error = ""
    }

type alias Clothes =
    List String

type alias ClothingDict =
    Dict String (List String)
