{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (***), arr)
import Data.Monoid (mempty, mconcat)
import Hakyll

main :: IO ()
main = hakyll $ do
  match "public/css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "public/images/*" straightCopy

  match "public/assets/*" straightCopy
  match "public/assets/**/*" straightCopy

  match "public/javascripts/*" straightCopy

  match "files/*" straightCopy

  match "templates/*" $ compile templateCompiler

  match "pages/*" $ do
    route $ setExtension ".html"
    compile $ pageCompiler
      >>> arr (copyBodyToField "content")
      >>> applyTemplateCompiler "templates/page.html"
      >>> applyTemplateCompiler "templates/layout.html"
      >>> relativizeUrlsCompiler

  match "posts/*" $ do
    route $ setExtension ".html"
    compile $ pageCompiler
      >>> arr (renderDateField "date" "%B %e, %Y" "Date unknown")
      >>> renderTagsField "prettytags" (fromCapture "tags/*")
      >>> arr (copyBodyToField "content")
      >>> applyTemplateCompiler "templates/post.html"
      >>> applyTemplateCompiler "templates/layout.html"
      >>> relativizeUrlsCompiler

  -- match "posts.html" $ route idRoute
  -- create "posts.html" $ constA mempty
  --   >>> arr (setField "title" "Posts")
  --   >>> setFieldPageList recentFirst "templates/compactpost.html" "posts" "posts/*"
  --   >>> applyTemplateCompiler "templates/index.html"
  --   >>> applyTemplateCompiler "templates/layout.html"

    -- Render posts list
  match "posts.html" $ route idRoute
  create "posts.html" $ constA mempty
    >>> arr (setField "title" "All posts")
    >>> requireAllA "posts/*" addPostList
    >>> applyTemplateCompiler "templates/posts.html"
    >>> applyTemplateCompiler "templates/layout.html"
    >>> relativizeUrlsCompiler


  match  "index.html" $ route idRoute
  create "index.html" $ constA mempty
    >>> arr (setField "title" "Home")
    >>> requireA "tags" (setFieldA "tagcloud" (renderTagCloud'))
    >>> requireAllA "posts/*" (id *** arr (take 5 . reverse . chronological) >>> addPostList)
    >>> applyTemplateCompiler "templates/index.html"
    >>> applyTemplateCompiler "templates/layout.html"
    >>> relativizeUrlsCompiler

    -- Tags
  create "tags" $
         requireAll "posts/*" (\_ ps -> readTags ps :: Tags String)

    -- Add a tag list compiler for every tag
  match "tags/*" $ route $ setExtension ".html"
  metaCompile $ require_ "tags"
      >>> arr tagsMap
      >>> arr (map (\(t, p) -> (tagIdentifier t, makeTagList t p)))



  match "rss.xml" $ route idRoute
  create "rss.xml" $ requireAll_ "posts/*" >>> renderRss feedConfiguration

  where
    renderTagCloud' :: Compiler (Tags String) String
    renderTagCloud' = renderTagCloud tagIdentifier 100 120

    tagIdentifier :: String -> Identifier (Page String)
    tagIdentifier = fromCapture "tags/*"


addPostList :: Compiler (Page String, [Page String]) (Page String)
addPostList = setFieldA "posts" $
    arr (reverse . chronological)
        >>> require "templates/postitem.html" (\p t -> map (applyTemplate t) p)
        >>> arr mconcat
        >>> arr pageBody

straightCopy :: RulesM (Pattern CopyFile)
straightCopy = do
  route idRoute
  compile copyFileCompiler


makeTagList :: String
            -> [Page String]
            -> Compiler () (Page String)
makeTagList tag posts =
    constA (mempty, posts)
        >>> addPostList
        >>> arr (setField "title" ("Posts tagged &#8216;" ++ tag ++ "&#8217;"))
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/layout.html"
        >>> relativizeUrlsCompiler



feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration { feedTitle       = "MitchCarroll.com",
                                        feedDescription = "Ruminations of a Dev and Poet",
                                        feedAuthorName  = "Mitchell Carroll",
                                        feedAuthorEmail = "mitch@mitchcarroll.com",
                                        feedRoot        = "http://mitchcarroll.com" }
