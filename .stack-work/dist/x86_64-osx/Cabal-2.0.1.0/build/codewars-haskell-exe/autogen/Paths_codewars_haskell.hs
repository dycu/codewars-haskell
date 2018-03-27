{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_codewars_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/bin"
libdir     = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/lib/x86_64-osx-ghc-8.2.2/codewars-haskell-0.1.0.0-B5bGtVnU5eAKCvg7jSYdFm-codewars-haskell-exe"
dynlibdir  = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/share/x86_64-osx-ghc-8.2.2/codewars-haskell-0.1.0.0"
libexecdir = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/libexec/x86_64-osx-ghc-8.2.2/codewars-haskell-0.1.0.0"
sysconfdir = "/Users/lukasz.dycjan/IdeaProjects/codewars-haskell/.stack-work/install/x86_64-osx/lts-11.2/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "codewars_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "codewars_haskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "codewars_haskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "codewars_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "codewars_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "codewars_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
