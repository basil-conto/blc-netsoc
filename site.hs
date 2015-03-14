--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Hakyll

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

  -- -- Favicon
  -- match "images/favicon.png" $ do
  --   route $ constRoute "favicon.png"
  --   compile copyFileCompiler

  -- CSS
  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  -- Reading
  match "reading.md" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  -- Pubkey
  match "pubkey.txt" $ do
    route $ constRoute "pubkey.txt"
    compile copyFileCompiler

  -- CV
  match "cv-blc.pdf" $ do
    route $ constRoute "cv-blc.pdf"
    compile copyFileCompiler

  -- Index
  match "index.md" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  -- Templates
  match "templates/*" $ compile templateCompiler

