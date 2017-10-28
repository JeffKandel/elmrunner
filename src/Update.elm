module Update exposing (..)

import Model exposing (Model)
---- UPDATE ----

type Msg
    = GenMale | GenFem

initialSuggestionsCommand : Cmd Msg
initialSuggestionsCommand =
  Cmd.none

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
            GenMale ->
                ({model | gender = "male"},Cmd.none)
            GenFem ->
                ({model | gender = "female"},Cmd.none)


