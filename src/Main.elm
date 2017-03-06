port module CodeAsCrimescene exposing (..)

import Html exposing (Html, input, label, div, text, button)
import Html.Attributes exposing (class, disabled, value)
import Html.Events exposing (onInput, onClick)
import Calc.Add exposing(..)
import Shell.Types exposing (..)
import Template exposing (template, render, withValue, withString)
import Template.Infix exposing ((<%), (%>))
-- import Ports.Exec.Types exposing(exec, execSuccess)

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
    Check |
    Exec

-- clone = template "git clone " <% .repository %> ".repos/" <% .target %> ""
clone = template "echo " <% .repository %> " result"

-- prepareRepo: Model -> { repository: String, target: String }
-- prepareRepo model = {
--     repository = model.repository,
--     -- target =


update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        UpdateRepository repoName -> ({ model | repository = repoName }, Cmd.none)

        Check -> ( model, check model.repository )

        Exec -> ( model, exec <| render clone { repository = model.repository })


view : Model -> Html Msg
view model =
    div []
     [
         text <| toString <| myadd 3 8,
         label [] [ text "Enter a GitRepository" ],
         input [ onInput UpdateRepository, value model.repository ] [],
         button [
             class "btn btn-primary", disabled (String.length model.repository < 1),
             onClick Exec
         ] [ text "clone" ]
     ]

--ports
port check: String -> Cmd msg
port suggestions : (String -> msg) -> Sub msg

port exec: String -> Cmd msg
port execSuccess: (String -> msg) -> Sub msg
port execError: (String -> msg) -> Sub msg

--subscriptions
subscriptions : Model -> Sub Msg
subscriptions model = Sub.batch [
    suggestions UpdateRepository
    , execSuccess UpdateRepository
 ]



main = Html.program { init = init, view = view, update = update, subscriptions = subscriptions }

