port module Main exposing (..)

import Tests
import MyTest
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit Tests.all
    -- List.map (run emit) [
    --     Tests.all,
    --     MyTest.suite
    -- ]


port emit : ( String, Value ) -> Cmd msg
