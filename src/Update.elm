module Update exposing (..)

import Model exposing (Model, Weather, Times, Clothes)
---- UPDATE ----

type Msg
    = GenderPicked String
    | IntensityPicked String
    | FeelPicked String
    | FetchTimes Times
    | FetchWeather Weather
    | GetClothes Clothes
    | GetLocation String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            GenderPicked selectedGender ->
                ({ model | gender = selectedGender }, Cmd.none)
            IntensityPicked selectedIntensity ->
                ({ model | intensity = selectedIntensity }, Cmd.none)
            FeelPicked selectedFeel ->
                ({ model | feel = selectedFeel }, Cmd.none)
            FetchTimes fetchedTimes ->
                ({ model | times = fetchedTimes }, Cmd.none)
            FetchWeather fetchedWeather ->
                ({ model | weather = fetchedWeather }, Cmd.none)
            GetClothes clothes ->
                ({ model | clothes = clothes }, Cmd.none)
            GetLocation input ->
                (model, Cmd.none)


