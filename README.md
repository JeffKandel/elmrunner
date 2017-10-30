# elmrunner

Hi, I'm ElmRunner!

Check me out at https://elmrunner.herokuapp.com/

# About elmrunner
elmrunner connects an Elm frontend with a simple clothing API to help you decide what to wear for your next run.  This is my first Elm application and it was a training ground to learn about:

* syntax
* types
* architecture
* handling API integrations
* JSON decoding

# The Goods
What's the state of my application?
* /src/Model.elm

What's even happening in my UI?
* /src/Update.elm -

What's it all going to look like?
* /src/View.elm -- Styled with tachyons-elm

Where are all those suggestions coming from?
* /src/DecodeWeather.elm
* /src/DecodeClothing.elm
* /server/api/index.js
* /server/index.js -- loadClothingData

# Areas for Improvement
elmrunner is a work in progress.  Going forward, I would like to learn more about Elm syntax and dry out the code in View.elm and Update.elm.  I will need to make it mobile responsive.  I want to revisit the clothing lookup and try to represent the data locally as an Elm Dict.  I would also add additional functionality to let users select their run location and to better process weather data.


# Thanks To
Elmrunner is is bootstrapped with [Create Elm App](https://github.com/halfzebra/create-elm-app). The application idea, some of the styling, and the json is borrowed from a Kat Busch's TypeScript & Material UI experiment [Runcool](https://katbusch.github.io/runcool).
