module RepoSelector.Utils exposing (extractGitName)

import Regex exposing (..)
import List exposing (head)
import Maybe.Extra exposing (..)


extractGitName : String -> String
extractGitName url =
    let
        pattern = regex "\\/([^./]+)\\.(git|bundle)"
        found = find (AtMost 1) pattern url |> head
        getSubmatch =
            .submatches >>
            head >>
            join
        match = case found of
            Nothing -> Nothing
            Just m -> getSubmatch m

    in
       case match of
           Nothing -> ""
           Just str -> str




