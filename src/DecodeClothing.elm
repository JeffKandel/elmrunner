module DecodeClothing exposing (ClothingResponse, decodeClothingResponse)

import Model exposing (ClothingDict)
import Json.Decode as Decode exposing (dict, Decoder)

type alias ClothingResponse =
    { clothingOptions : ClothingDict}

decodeClothingResponse : Decoder ClothingResponse
decodeClothingResponse =
    dict ClothingResponse
