{-|
Module      : HsLua.Marshalling
Copyright   : © 2007–2012 Gracjan Polak;
              © 2012–2016 Ömer Sinan Ağacan;
              © 2017-2021 Albert Krewinkel
License     : MIT
Maintainer  : Albert Krewinkel <tarleb+hslua@zeitkraut.de>

Functions to push and retrieve data to and from Lua.
-}
module HsLua.Marshalling
  ( -- * Receiving values from Lua stack (Lua → Haskell)
    Peeker
  , runPeeker
  , Result (..)
  , force
  , retrieving
  , failure
  , resultToEither
    -- ** Primitive types
  , peekBool
  , peekIntegral
  , peekRealFloat
    -- ** Strings
  , peekByteString
  , peekLazyByteString
  , peekString
  , peekText
  , peekStringy
  , peekName
    -- ** Readable types
  , peekRead
    -- ** Collections
  , peekKeyValuePairs
  , peekList
  , peekMap
  , peekSet
    -- ** Userdata
  , peekAny
    -- ** Combinators
  , optional
  , choice
  , peekFieldRaw
  , peekPair
  , peekTriple
    -- ** Lua peek monad
  , Peek (..)
  , runPeek
  , forcePeek
  , liftLua
  , withContext
  , failPeek
    -- ** Helpers
  , typeMismatchMessage
  , reportValueOnFailure

    -- * Pushing values to Lua stack (Haskell → Lua)
  , module HsLua.Marshalling.Push
  , pushAny

    -- * Utilities
  , pushIterator
  ) where

import Prelude hiding (compare, concat)

import HsLua.Marshalling.Peek
import HsLua.Marshalling.Peekers
import HsLua.Marshalling.Push
import HsLua.Marshalling.Userdata (peekAny, pushAny, pushIterator)
