{-# LANGUAGE TemplateHaskell, QuasiQuotes, TypeFamilies, MultiParamTypeClasses, OverloadedStrings #-}
module Main where

import Wai.Routes
import Network.Wai.Handler.Warp

data MyRoute = MyRoute
mkRoute "MyRoute" [parseRoutes|
/ HomeR GET
|]

getHomeR :: Handler MyRoute
getHomeR = runHandlerM $ plain "Hello, World!"

application :: RouteM ()
application = route MyRoute

main :: IO ()
main = do
  putStrLn "Starting server on port 8080"
  run 8080 $ waiApp application

