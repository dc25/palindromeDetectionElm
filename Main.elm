import String exposing (reverse, length) 
import Html exposing (Html, Attribute, text, div, input)
import Html.Attributes exposing (placeholder, value, style)
import Html.Events exposing (on, targetValue)
import Signal exposing (Address)
import StartApp.Simple exposing (start)

-- The following function (copied from Haskell) satisfies the 
-- rosettacode task description.
is_palindrome x = x == reverse x

-- The remainder of the code demonstrates the use of the function 
-- in a complete Elm program.
main = start { model = "", view = view, update = update }

update newStr oldStr = newStr

view : Address String -> String -> Html
view address candidate =
  div []
    ([ input
        [ placeholder "Enter a string to check."
        , value candidate
        , on "input" targetValue (Signal.message address)
        , myStyle
        ]
        []
     ] ++ 
     [ let testResult = 
             is_palindrome candidate

           statement = 
             if testResult then "PALINDROME!!" else "not a palindrome"

       in div [ myStyle] [text statement]
     ])

myStyle : Attribute
myStyle =
  style
    [ ("width", "100%")
    , ("height", "20px")
    , ("padding", "5px 0 0 5px")
    , ("font-size", "1em")
    , ("text-align", "left")
    ]
