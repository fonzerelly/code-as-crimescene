module RepoSelector.Spec exposing (all)

import RepoSelector.Utils exposing (extractGitName)

import Test exposing (..)
import Expect

all : Test
all =
    describe "RepoSelector"
        [ describe "extractGitName"
            [
                test "it should extract the name of a git url" <|
                    \() -> Expect.equal
                        (extractGitName "https://github.com/fonzerelly/MyConwaysGameOfLife.git")
                        "MyConwaysGameOfLife"

                ,test "it should extract the name of a bundle" <|
                    \() -> Expect.equal
                        (extractGitName "../work/angular-shared-app.bundle")
                        "angular-shared-app"
            ]
        ]
