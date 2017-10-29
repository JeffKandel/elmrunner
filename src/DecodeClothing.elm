module DecodeClothing exposing (decodeClothingResponse)

import Json.Decode as Decode exposing (string, list, Decoder)

decodeClothingResponse : Decoder (List String)
decodeClothingResponse =
    list string
