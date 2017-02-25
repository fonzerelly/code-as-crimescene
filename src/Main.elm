port module Spelling exposing (..)

import Html exposing (Html, input, label, div, text, button)
import Html.Attributes exposing (class, disabled, value)
import Html.Events exposing (onInput, onClick)

-- model
type alias Model = {
    repository: String
}

-- model : Model
-- model = { repository = "" }
init : (Model, Cmd Msg)
init = (Model "", Cmd.none)


--Update
type Msg =
    UpdateRepository String |
    Check


update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        UpdateRepository repoName -> ({ model | repository = repoName }, Cmd.none)

        Check -> ( model, check model.repository )


view : Model -> Html Msg
view model =
    div []
     [
         label [] [ text "Enter a GitRepository" ],
         input [ onInput UpdateRepository, value model.repository ] [],
         button [
             class "btn btn-primary", disabled (String.length model.repository < 1),
             onClick Check
         ] [ text "clone" ]
     ]

--ports
port check: String -> Cmd msg
port suggestions : (String -> msg) -> Sub msg

--subscriptions
subscriptions : Model -> Sub Msg
subscriptions model = suggestions UpdateRepository

main = Html.program { init = init, view = view, update = update, subscriptions = subscriptions }

