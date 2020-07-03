{-# LANGUAGE OverloadedStrings #-}

import Hakyll
import Text.Pandoc.Options

main :: IO ()
main = hakyll $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "*.txt" $ do
    route idRoute
    compile copyFileCompiler

  match "*.pdf" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match (fromList ["about.md", "projects.md", "contact.md"]) $ do
    route $ setExtension "html"
    compile $
      pandocMathCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

  match "projects/*" $ do
    route $ setExtension "html"
    compile $
      pandocMathCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

  match "posts/*" $ do
    route $ setExtension "html"
    compile $
      pandocMathCompiler
        >>= saveSnapshot "content"
        >>= loadAndApplyTemplate "templates/post.html" postCtx
        >>= loadAndApplyTemplate "templates/default.html" postCtx
        >>= relativizeUrls
  create ["archive.html"] $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      let archiveCtx =
            listField "posts" postCtx (return posts)
              <> constField "title" "Archives"
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
        >>= loadAndApplyTemplate "templates/default.html" archiveCtx
        >>= relativizeUrls

  match "index.html" $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      let indexCtx =
            listField "posts" postCtx (return posts)
              -- clear title
              <> constField "title" ""
              <> defaultContext

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y"
    <> teaserField "teaser" "content"
    <> defaultContext

pandocMathCompiler :: Compiler (Item String)
pandocMathCompiler =
  let mathExtensions =
        extensionsFromList $
          [ Ext_tex_math_dollars,
            Ext_tex_math_double_backslash,
            Ext_latex_macros
          ]
      defaultExtensions = writerExtensions defaultHakyllWriterOptions
      newExtensions = defaultExtensions <> mathExtensions
      writerOptions =
        defaultHakyllWriterOptions
          { writerExtensions = newExtensions,
            writerHTMLMathMethod = MathJax ""
          }
   in pandocCompilerWith defaultHakyllReaderOptions writerOptions