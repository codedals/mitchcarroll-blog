---
title: On Visual Mnemonics, Kanji, and a bit of Haskell
author: Mitch
tags: memory, kanji, japanese, haskell
---

Recently, I became obsessed with increasing my memory. I'm not sure if it was before or after I heard about the book [*Moonwalking with Einstein*](http://www.amazon.com/Moonwalking-Einstein-Science-Remembering-Everything/dp/0143120530). A few years ago, I became familair with the [memory palace](http://en.wikipedia.org/wiki/Method_of_loci) technique, but it was just something I toyed with for a few days, and then moved on. Since reading this book, I'm hooked.

The book is more an autobiographical account of [Joshua Foer's](http://joshuafoer.com/) ascent to U.S. Memory Champion. Thus, while entertaining, it's not intended to be a how-to manual. So, I figured I'd research the main characters in the book, and learn how exactly these people have developed their immense memory capabilities: [Ben Pridmore](http://en.wikipedia.org/wiki/Ben_Pridmore), [Tony Buzan](http://en.wikipedia.org/wiki/Tony_Buzan), and Foer's coach, [Ed Cooke](http://en.wikipedia.org/wiki/Ed_Cooke_%28author%29). During my research on Mr. Cooke, I came across his platform  [Memrise](http://www.memrise). I can't speak highly enough about this thing, it's pretty much become my goto for studying laguage. They combine the concepts of [spaced repition](http://en.wikipedia.org/wiki/Spaced_repetition) with [mnemonics](http://en.wikipedia.org/wiki/Mnemonic). 

I've been a student of Japanese for more than a few years. Like many who foray into the language, I shied away (sometimes cursing) from [kanji](http://en.wikipedia.org/wiki/Kanji). I figured I'd just pick up all the kanji I needed as I studied grammar -- yeah yeah, I know... Naturally, I hit a plateau, and I knew I could only get past that plateau was by going at kanji head on. I went the rote memorization route -- taking 10-20 kanji at a time, and just repeteadly writing them until they stuck. Of course, this method works, but eh, it's kinda boring. 

So, back to Memrise. There is a huge amount of Japanese lessons on there, so I picked up one of the Kanji courses. It's been a blast so far, and pretty addictive. Essentially, you take a kanji as a whole, or break it into its radicals (similar to the [Heisig method](http://en.wikipedia.org/wiki/Remembering_the_Kanji_and_Remembering_the_Hanzi)), and form a visual association. I've posted some screenshots below:

<img alt="Agriculture" title="Kinda...sorta" src="/public/images/memrise_nou.png" />

And another:

<img alt="Story" title="A bit of a stretch, but it works!" src="/public/images/memrise_kai.png" />

The mnemonics you see (the sentences below the green bars) are community generated. Some are pretty good, but I tend to make my own -- also available to the community.
Anywho, the site is awesome, [go check it out](http://www.memrise.com). It really turns memorization into a fun game.

So I mentioned Haskell in the title, let me explain. After finishing *Moonwalking with Einstein* I set a goal to memorize a deck of playing cards in random order. Now, owning a deck of cards is crucial in this endeavor, and I don't own a deck of cards. Also, I just so happen to be living in Thailand, and playing cards are pretty expensive for some reason. I figured, eh, I'll just model a deck and wrap a quick and dirty UI around it. In my professional life, I use Ruby as my primary language, so whenever I have a silly personal project, I like to use Haskell to keep up my chops (it's a use it or lose it language).
 
I hadn't done any [Haskell GUI](http://en.wikibooks.org/wiki/Haskell/GUI) programming before, and this looked liked a nice into project. After modeling the deck, it was tme for the GUI; however, this proved an excercise in frustration. Trying to install the GUI bindings on OSX went from a few hours, to a few days -- a quick google search will show that I'm not alone in this madness. I eventually said bollocks to it, as I realized I had become more obsessed with getting the GUI libraries working than in memorizing the deck of cards. Anywho, here is a <a href="/pages/haskell_cards.html">link</a> to the modeled deck if anyone wants it. If I ever get around to solving the bindings issue on OSX, I'll add a quick write up
