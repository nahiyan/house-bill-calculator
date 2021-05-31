module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, i, input, table, tbody, td, text, tfoot, th, thead, tr)
import Html.Attributes exposing (class, colspan, scope, type_, value)
import Html.Events exposing (on, targetValue)
import Json.Decode as JsonD
import Round


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { monthlyRent : Float
    , waterBill : Float
    , gasBill : Float
    , garbageBill : Float
    , commonBill : Float
    , electricityBill : Float
    }


type Msg
    = UpdateMonthlyRent String
    | UpdateWaterBill String
    | UpdateGasBill String
    | UpdateGarbageBill String
    | UpdateCommonBill String
    | UpdateElectricityBill String


init : Model
init =
    { monthlyRent = 0
    , waterBill = 0
    , gasBill = 0
    , garbageBill = 0
    , commonBill = 0
    , electricityBill = 0
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateMonthlyRent amount ->
            { model | monthlyRent = amount |> String.toFloat |> Maybe.withDefault 0 }

        UpdateWaterBill amount ->
            { model | waterBill = amount |> String.toFloat |> Maybe.withDefault 0 }

        UpdateGasBill amount ->
            { model | gasBill = amount |> String.toFloat |> Maybe.withDefault 0 }

        UpdateGarbageBill amount ->
            { model | garbageBill = amount |> String.toFloat |> Maybe.withDefault 0 }

        UpdateCommonBill amount ->
            { model | commonBill = amount |> String.toFloat |> Maybe.withDefault 0 }

        UpdateElectricityBill amount ->
            { model | electricityBill = amount |> String.toFloat |> Maybe.withDefault 0 }


view : Model -> Html Msg
view model =
    let
        total =
            model.monthlyRent + model.waterBill + model.gasBill + model.garbageBill + model.commonBill + model.electricityBill
    in
    div [ class "container" ]
        [ h1 [ class "mt-3" ] [ text "House Bill Calculator" ]
        , table [ class "table table-striped align-middle" ]
            [ thead []
                [ tr [ class "d-flex" ]
                    [ td [ scope "col", class "col-2" ]
                        [ text "#" ]
                    , th [ scope "col", class "col-5" ]
                        [ text "Charge Type" ]
                    , th [ scope "col", class "col-5" ]
                        [ text "Amount (BDT)" ]
                    ]
                ]
            , tbody []
                [ tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "1" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "fas fa-file-invoice-dollar" ] [] ]
                            , div [ class "col-9" ] [ text "Rent" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.monthlyRent
                            , on "blur" (targetValue |> JsonD.map UpdateMonthlyRent)
                            ]
                            []
                        ]
                    ]
                , tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "2" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "fas fa-water" ] [] ]
                            , div [ class "col-9" ] [ text "Water" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.waterBill
                            , on "blur" (targetValue |> JsonD.map UpdateWaterBill)
                            ]
                            []
                        ]
                    ]
                , tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "3" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "fas fa-burn" ] [] ]
                            , div [ class "col-9" ] [ text "Gas" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.gasBill
                            , on "blur" (targetValue |> JsonD.map UpdateGasBill)
                            ]
                            []
                        ]
                    ]
                , tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "4" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "far fa-trash-alt" ] [] ]
                            , div [ class "col-9" ] [ text "Garbage" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.garbageBill
                            , on "blur" (targetValue |> JsonD.map UpdateGarbageBill)
                            ]
                            []
                        ]
                    ]
                , tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "5" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "fab fa-creative-commons-by" ] [] ]
                            , div [ class "col-9" ] [ text "Common" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.commonBill
                            , on "blur" (targetValue |> JsonD.map UpdateCommonBill)
                            ]
                            []
                        ]
                    ]
                , tr [ class "d-flex" ]
                    [ td [ scope "row", class "col-2" ]
                        [ text "6" ]
                    , td [ class "col-5" ]
                        [ div [ class "row" ]
                            [ div [ class "col-1" ] [ i [ class "fas fa-bolt" ] [] ]
                            , div [ class "col-9" ] [ text "Electricity" ]
                            ]
                        ]
                    , td [ class "col-5" ]
                        [ input
                            [ class "form-control"
                            , type_ "input"
                            , value <| String.fromFloat <| model.electricityBill
                            , on "blur" (targetValue |> JsonD.map UpdateElectricityBill)
                            ]
                            []
                        ]
                    ]
                ]
            , tfoot [ class "table-striped" ]
                [ tr
                    [ class "d-flex" ]
                    [ td [ class "col-2" ] []
                    , td
                        [ class "col-10" ]
                        [ table
                            [ class "table table-striped" ]
                            [ thead []
                                [ tr [ class "d-flex" ]
                                    [ th
                                        [ scope "col", class "col-6" ]
                                        []
                                    , th
                                        [ scope "col", class "col-6" ]
                                        [ text "Amount (BDT)" ]
                                    ]
                                ]
                            , tbody []
                                [ tr [ class "d-flex" ]
                                    [ td [ class "fw-bold col-6 ps-0" ]
                                        [ text "Total" ]
                                    , td [ class "text-success fw-bold col-6" ]
                                        [ text <| Round.round 2 <| total ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]

            -- [ tr []
            --     [ th [ scope "col" ]
            --         []
            --     , th [ scope "col" ]
            --         []
            --     , th [ scope "col" ]
            --         [ text "Amount (BDT)" ]
            --     ]
            -- , tr []
            --     [ td []
            --         []
            --     , td [ class "fw-bold" ]
            --         [ text "Total" ]
            --     , td [ class "text-success fw-bold" ]
            --         [ text <| Round.round 2 <| total ]
            --     ]
            -- ]
            ]
        ]
