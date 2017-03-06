module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String

-- Project specific Tests
import RepoSelector.Spec exposing (all)


all : Test
all =
    describe "Sample Test Suite" [
        RepoSelector.Spec.all
    ]
