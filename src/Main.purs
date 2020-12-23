module Main where

import Control.Bind (bind, discard)
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Class.Console (log)
import Es4x.Web (createRouter, end, endStr, handlePath, response, runHttpServer, setChunked, write)

main :: Effect Unit
main = do
  router <- createRouter
  handlePath router "/" \req -> do
    resp <- response req
    endStr resp  "Hello Purescript ES4X!"

  handlePath router "/page" \req -> do
    resp <- response req
    setChunked resp
    write resp "You are on a page"
    end resp

  runHttpServer router 3000

  log "Server started on port 3000"
