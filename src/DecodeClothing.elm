module DecodeClothing exposing (ClothingResponse, decodeClothingResponse)

import Model exposing (ClothingDict)
import Dict exposing (..)
import Json.Decode as Decode exposing (dict, string, list, Decoder)

type alias ClothingResponse =
    { clothingOptions : ClothingDict}

decodeClothingResponse : Decoder (Dict String (List String))
decodeClothingResponse =
    dict (list string)
