module Favicon exposing (fromUrl)

{-| Gives the favicon URL for a given URL.

@docs fromUrl
-}

import Erl


{-| Get the Favicon URL for a given URL.

Returns Nothing if the URL protocol does not support favicons.
-}
fromUrl : String -> Maybe String
fromUrl urlString =
    let
        url =
            if String.left 1 urlString == "/" then
                Erl.parse ("http:/" ++ urlString)
            else
                Erl.parse urlString
    in
        if url.protocol == "https" || url.protocol == "http" then
            Just <|
                Erl.toString
                    { url
                        | path = [ "favicon.ico" ]
                        , hash = ""
                        , query = []
                        , hasTrailingSlash = False
                    }
        else
            Nothing
