module View exposing (..)


import Model exposing (..)
import Update exposing (Msg(..))

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Tachyons exposing (..)
import Tachyons.Classes as Classes exposing (..)

toHtmlList : List String -> Html msg
toHtmlList strings =
  ul [ classes [Classes.list, pl0, measure, center]] (List.map toLi strings)

toLi : String -> Html msg
toLi s =
  li [classes [lh_copy, ba, bl_0, bt_0, br_0, b__dotted, b__black_30]] [ text s ]

view : Model -> Html Msg
view model =
    div [ classes [pa4_l, flex, flex_wrap_ns] ] [
        Html.form [classes [w_50_l, bg_light_red, flex, items_center, justify_center, pa4, mw7, center, br2_ns, ba, b__black_10]] [
            Html.fieldset [classes [cf, bn, ma0, pa0]] [
                Html.legend [classes [pa0, f5, tc, f4_ns, mb3, black_80]] [
                    tachyons.css
                    , text "Run Location: Central Park"
                ]
                , div [classes [flex, pa4]] [
                        Html.a [ classes [(if model.gender == "male" then "bg-black white" else ""), w_50, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1] , onClick <| SetGender "male"] [
                            Html.span [classes [ center, pl1]] [
                                text "Male"
                            ]
                        ]
                        , Html.a [ classes [(if model.gender == "female" then "bg-black white" else ""), w_50, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetGender "female"] [
                            Html.span [classes [ center, pl1]] [
                                text "Female"
                            ]
                        ]
                ]
                , div [classes [flex, pa4]] [
                        Html.a [ classes [(if model.feel == "cool" then "bg-black white" else ""), w_33, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1] , onClick <| SetFeel "cool"] [
                            Html.span [classes [ center, pl1]] [
                                text "Cool"
                            ]
                        ]
                        , Html.a [ classes [(if model.feel == "in between" then "bg-black white" else ""), w_33, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetFeel "in between"] [
                            Html.span [classes [ center, pl1]] [
                                text "Medium"
                            ]
                        ]
                        , Html.a [ classes [(if model.feel == "warm" then "bg-black white" else ""), w_33, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetFeel "warm"] [
                            Html.span [classes [center, pl1]] [
                                text "Warm"
                            ]
                        ]
                ]
                , div [classes [flex, pa4]] [
                        Html.a [ classes [(if model.intensity == "easy run" then "bg-black white" else ""), w_25, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1] , onClick <| SetIntensity "easy run"] [
                            Html.span [classes [ center, pl1]] [
                                text "Easy"
                            ]
                        ]
                        , Html.a [ classes [(if model.intensity == "long run" then "bg-black white" else ""), w_25, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetIntensity "long run"] [
                            Html.span [classes [ center, pl1]] [
                                text "Long"
                            ]
                        ]
                        , Html.a [ classes [(if model.intensity == "hard workout" then "bg-black white" else ""), w_25, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetIntensity "hard workout"] [
                            Html.span [classes [ center, pl1]] [
                                text "Hard"
                            ]
                        ]
                        , Html.a [ classes [(if model.intensity == "race" then "bg-black white" else ""), w_25, f5, no_underline, black, bg_animate, hover_bg_black, hover_white, inline_flex, items_center, pa3, ba, border_box, mr1], onClick <| SetIntensity "race"] [
                            Html.span [classes [ center, pl1]] [
                                text "Race"
                            ]
                        ]
                ]

            ]
        ]
        , div [ classes [ w_33_l, bg_moon_gray, items_center, justify_center, pa4, mw7, center, br2_ns, ba, b__black_10]] [
            div [classes [cf, bn, ma0, pa0]] [
                Html.legend [classes [pa0, f5, tc, f4_ns, mb3, black_80]] [
                    text "Suggested Clothing"
                ]
                , div [classes [flex, pa4]] [
                     toHtmlList model.clothes
                ]
            ]
        ]
    ]


