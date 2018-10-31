---
title: Haskell Cards
---

This page is literate Haskell. It can be downloaded <a href="/files/haskell_cards.lhs">here</a>.

~~~~{.haskell}

> module Main where
> import System.Random

> import Control.Monad
> import Control.Monad.ST
> import Data.Array.ST
> import Data.STRef

> --CARD MODELING
> data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
>               deriving (Eq, Ord, Bounded, Enum)

> instance Show Rank where
>     show rank = 
>         case rank of Two   -> "2"
>                      Three -> "3"
>                      Four  -> "4"
>                      Five  -> "5"
>                      Six   -> "6"
>                      Seven -> "7"
>                      Eight -> "8"
>                      Nine  -> "9"
>                      Ten   -> "10"
>                      Jack  -> "J"
>                      Queen -> "Q"
>                      King  -> "K"
>                      Ace   -> "A"


> data Suit = Diamonds | Spades | Hearts | Clubs 
>             deriving (Eq,Enum,Bounded)
> instance Show Suit where
>     show suit = 
>         case suit of Spades   -> "♠"
>                      Diamonds -> "♦"
>                      Hearts   -> "♥"
>                      Clubs    -> "♣"
          
> data Card = Card {rank::Rank , suit::Suit}

> instance Show Card where
>     show(Card a b) = show a ++ " of " ++ show b

> instance Eq Card where
>     Card a b == Card c d = 
>         a == c && b == d
>     Card a b /= Card c d = 
>         a /= c || b /= d

> type Deck = [Card]

> standard_deck :: Deck
> standard_deck = [Card x y | x <- [Two .. Ace],  y <- [Diamonds .. Clubs]]

> --END CARD MODELING

> -- Shuffle

> shuffle_deck :: StdGen -> [a] -> [a]
> shuffle_deck g list = runST $ do
>     let n = length list
>     gref <- newSTRef g
>     arr <- listToArray list
>     getElems arr
>     forM_ [n,n-1..2] $ \p -> do
>         m <- rand (1,p) gref
>         swap arr m p
>     getElems arr
>  where 
>     rand range gref = do
>         g <- readSTRef gref
>         let (v,g') = randomR range g
>         writeSTRef gref g'
>         return v

>     swap a n m = do 
>         [n',m'] <- mapM (readArray a) [n,m] 
>         mapM (uncurry $ writeArray a) [(m,n'),(n,m')]

> listToArray :: [a] -> ST s (STArray s Int a)
> listToArray list = let n = length list
>                    in  newListArray (1,n) list

> --Print a Random Deck to stdout
> main = do 
>   gen <- getStdGen
>   putStr $ unlines $ map show (shuffle_deck gen standard_deck)

~~~~
