module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Round


-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



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
    in
    div
        []
        [ input [ onInput UpdateAthleteWeight ] []
        , input [ onInput UpdateLiftedWeight ] []
        , div
            []
            [ text (Round.round 2 factor) ]
        ]
