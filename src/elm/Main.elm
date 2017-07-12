module Main exposing (..)

import Html as H exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Round


-- APP


main : Program Never Model Msg
main =
    H.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type AthleteWeight
    = AthleteWeight Int


type LiftedWeight
    = LiftedWeight Int


type alias Model =
    { athleteWeight : AthleteWeight
    , liftedWeight : LiftedWeight
    }


model : Model
model =
    { athleteWeight = AthleteWeight 0, liftedWeight = LiftedWeight 0 }



-- UPDATE


type Msg
    = UpdateAthleteWeight String
    | UpdateLiftedWeight String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAthleteWeight weightString ->
            let
                weightInt =
                    case String.toInt weightString of
                        Ok w ->
                            w

                        Err _ ->
                            0
            in
            { model | athleteWeight = AthleteWeight weightInt }

        UpdateLiftedWeight weightString ->
            let
                weightInt =
                    case String.toInt weightString of
                        Ok w ->
                            w

                        Err _ ->
                            0
            in
            { model | liftedWeight = LiftedWeight weightInt }



-- VIEW


allometricFactor : AthleteWeight -> LiftedWeight -> Float
allometricFactor (AthleteWeight athleteWeightInt) (LiftedWeight liftedWeightInt) =
    toFloat liftedWeightInt * (toFloat athleteWeightInt ^ (-2 / 3))


view : Model -> Html Msg
view model =
    let
        factor =
            allometricFactor model.athleteWeight model.liftedWeight
                |> Round.round 2
    in
    div
        [ class "row" ]
        [ div
            [ class "col-md-12" ]
            [ H.form
                []
                [ div
                    [ class "form-group" ]
                    [ label [ for "athlete-weight" ] [ text "Athlete weight" ]
                    , input [ id "athlete-weight", class "form-control", onInput UpdateAthleteWeight ] []
                    ]
                , div
                    [ class "form-group" ]
                    [ label [ for "lifted-weight" ] [ text "Lifted weight" ]
                    , input [ id "lifted-weight", class "form-control", onInput UpdateLiftedWeight ] []
                    ]
                ]
            , div
                []
                [ text ("Your allometric factor is: " ++ factor) ]
            ]
        ]
