{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
{- |
Module      : Main
Copyright   : © 2022 Albert Krewinkel
License     : MIT
Maintainer  : Albert Krewinkel <albert@hslua.org>

Re-implementation of the standard Lua interpreter.
-}
module Main (main) where
import HsLua.Core  as Lua (Exception, openlibs, run)
import HsLua.CLI (Settings (..), runStandalone)

-- | Run a default Lua interpreter.
main :: IO ()
main = do
  let settings = Settings
        { settingsVersionInfo = ""
        , settingsRunner = \action -> run $ do
            openlibs
            action
        }
  runStandalone @Lua.Exception settings
