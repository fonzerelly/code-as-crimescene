-- import Test exposing (Test, suite, test, assertEqual)
-- import Test
module MyTest exposing (..)

import Test exposing (..)
import Expect

suite : Test
suite =
    describe "MyTests" [
        test "Equality" <|
            \() ->
                Expect.equal "test" "test"

    ]


