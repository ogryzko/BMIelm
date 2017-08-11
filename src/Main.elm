module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    { age : Int
    , gender : Gender
    , height : Float
    , weight : Float
    }


type Gender
    = Male
    | Female


init : ( Model, Cmd Msg )
init =
    ( Model 0 Male 100 100, Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "panel2" ]
        [ table [ id "calinputtable", attribute "width" "263" ]
            [ Html.form [ name "calform" ]
                []
            , input [ id "ctype", name "ctype", type_ "hidden", value "metric" ]
                []
            , tbody []
                [ tr []
                    [ td [ attribute "width" "50" ]
                        [ text "Age" ]
                    , td [ align "right", attribute "width" "140" ]
                        [ input [ class "innormal", id "cage", name "cage", type_ "text", value "25" ]
                            []
                        ]
                    , td [ attribute "width" "73" ]
                        [ text " " ]
                    ]
                , viewGender model
                ]
            ]
        , table [ attribute "bgcolor" "#eeeeee", id "standardheightweight", attribute "style" "display: none;", attribute "width" "263" ]
            [ tbody []
                [ tr []
                    [ td [ attribute "width" "50" ]
                        [ text "Height" ]
                    , td [ align "right", attribute "width" "140" ]
                        [ input [ class "in2char", id "cheightfeet", name "cheightfeet", type_ "text", value "5" ]
                            []
                        , text "feet "
                        , input [ class "in2char", id "cheightinch", name "cheightinch", type_ "text", value "10" ]
                            []
                        ]
                    , td [ attribute "width" "73" ]
                        [ text "inches" ]
                    ]
                , tr []
                    [ td []
                        [ text "Weight" ]
                    , td [ align "right" ]
                        [ input [ class "innormal", id "cpound", name "cpound", type_ "text", value "160" ]
                            []
                        ]
                    , td []
                        [ text "pounds" ]
                    ]
                ]
            ]
        , table [ attribute "bgcolor" "#eeeeee", id "metricheightweight", attribute "style" "display: block;", attribute "width" "263" ]
            [ tbody []
                [ viewHeight model
                , tr [ id "metricweight" ]
                    [ td []
                        [ text "Weight" ]
                    , td [ align "right" ]
                        [ input [ class "innormal", id "ckg", name "ckg", type_ "text", value "60" ]
                            []
                        ]
                    , td []
                        [ text "kilograms" ]
                    ]
                ]
            ]
        , table [ attribute "bgcolor" "#eeeeee", attribute "width" "263" ]
            [ tbody []
                [ tr []
                    [ td [ align "right", attribute "colspan" "2", attribute "width" "190" ]
                        [ input [ name "printit", type_ "hidden", value "0" ]
                            []
                        , input [ alt "Calculate", src "//d26tpo4cm8sb6k.cloudfront.net/img/calculate.png", type_ "image", value "Calculate" ]
                            []
                        ]
                    , td [ attribute "width" "73" ]
                        [ text " " ]
                    ]
                ]
            ]
        ]


viewGender : Model -> Html Msg
viewGender model =
    tr []
        [ td []
            [ text "Gender" ]
        , td [ align "right" ]
            [ label [ for "csex1" ]
                [ input [ attribute "checked" "", id "csex1", name "csex", type_ "radio", value "m" ]
                    []
                , text "Male"
                ]
            , text "  "
            , label [ for "csex2" ]
                [ input [ id "csex2", name "csex", type_ "radio", value "f" ]
                    []
                , text "Female"
                ]
            ]
        , td []
            [ text " " ]
        ]


viewWeight : Model -> Html Msg
viewWeight model =
    tr [ id "metricweight" ]
        [ td []
            [ text "Weight" ]
        , td [ align "right" ]
            [ input [ class "innormal", id "ckg", name "ckg", type_ "text", value "60" ]
                []
            ]
        , td []
            [ text "kilograms" ]
        ]


viewHeight : Model -> Html Msg
viewHeight model =
    tr []
        [ td [ attribute "width" "50" ]
            [ text "Height" ]
        , td [ align "right", attribute "width" "140" ]
            [ input [ class "innormal", id "cheightmeter", name "cheightmeter", type_ "text", value "180" ]
                []
            ]
        , td [ attribute "width" "73" ]
            [ text "centimeters" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
