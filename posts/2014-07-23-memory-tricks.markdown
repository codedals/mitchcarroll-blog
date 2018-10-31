---
title: Memory Tricks and (mildly) Interesting Hacks
author: Mitch
tags: memory, binary
---

The human brain can be [trained](http://www.youtube.com/watch?v=_vGMsVirYKs) to do [incredible](http://www.youtube.com/watch?v=sEvJ2sKIb6U) feats. If you watched the videos, then you are no doubt impressed. These kids in the videos are masters at the abacus, and have been training for years with the device. They are not adding numbers (in the typical sense), but are visualizing an abacus or soroban, and performing calculations on this mental model. The techinque is called [anzan](http://japandailypress.com/mental-math-calculating-numbers-the-flash-anzan-way-3017513). After many years of study, the students no longer need the physical representation, as their mental reproductions are completely functional. Go back and check the 2nd linked video, note the finger movements. 

Maybe you've seen a movie where one of the guys is playing **chess blindfolded. Anyone who has played chess competitively for a few years knows that this is a trivial feat. As the children above have trained their minds to host mental abacus, as does the chess player have a fully functional model of a chess board and its 32 pieces. I believe the beauty of the human brain, and the core of its intelligence is that it is a programmable pattern recognition, simulation, and synthesis engine. 

In this post, I'm not gonna teach you how to calculate streams of numbers in record time (I can't), but I will show you a few tricks you can use to slightly wow your friends, or at least get an "Umm, I guess that's kinda cool."

## Base Conversion and Coin Flips
The average human can keep about [7 things (± 2)](http://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two) in working memory. That's it. However, that's enough if you know how to store information in a compressed and efficient form.
What's easier to remember, 1010 1101 1011 0101 1011 or 711,515 or 10, 13, 11, 5, 11 ? Each set represents the same data, just presented in different ways. However, I'd wager the latter 2 are a bit easier to remember than the first. Here is a conversion method you can use to store long strings of [binary information](http://en.wikipedia.org/wiki/Binary_data) in your working memory. A good candidate, and our example, is successive coin flips.

In order to do this feat (in a somewhat impressive manner) you need to be able to perform binary to decimal (and vice versa) conversions, all mentally. If you're a programmer or generally mathematically inclined, then you already know how to do this. 

I recommend starting with 4-digit binary numbers (i.e. 0000 => 0, 0001 => 1....). We're using 4 digits, because we're going to group the coin flips in arrays of length 4. You will be mentally converting sets of coin flips ([H]eads => 0, [T]ails => 1) to 4-digit binary numbers, and THEN, memorizing those as decimal numbers. The trick here is to be able to convert the binary digits to decimal in real time, or at least in pace with your buddy's coin flipping speed. With a bit of practice, it's quite easy, and because we're limiting ourselves to 4 digits, its just a matter of 16 different combinations: 0-15, and in time, they should be sight recognizable.

So, you tell your buddy you can memorize 20 coin flips in perfect order, here is how you would handle the sequence:

H, H, T, H => 0010 => 2

T, T, T, H => 1110 => 14

H, T, H, T => 0101 => 5

T, T, H, H => 1100 => 12 

H, H, H, T => 0001 => 1

By this point, you should have 5 decimal numbers committed to memory: [2, 14, 5, 12, 1] (simple enough, as it is within our 7 ± 2 memory limits). 

Now here comes the part where you wow your friends and win the love of the land. To reproduce the order of the coin flips, simply convert your decimal digits back to binary. That decimal 2 above becomes => 0010 => H, H, T, H. So on and so forth. Now with your new found powers, go win a beer or 2 at your nearest pub!

Fun fact: Ben Pridmore holds the world record of [memorizing 930](http://www.world-memory-statistics.com/discipline.php?id=binary5) binary digits in 5 minutes.


## Exhaustive Searches and Tip o' the Tongue
We've all had it happen. We know the answer, but we just can't get it out. Hell, most times, we can even recall the first letter of the word or name...but it's just not coming out (the brain has pretty shitty bookkeeping). It's on the [tip of your tongue](http://en.wikipedia.org/wiki/Tip_of_the_tongue), and it's gonna stay there unless you do something about it. 

Even if I can't consciously recall one letter of the word I'm looking for, most often, the essence of the sound is somewhere in my subconscious mind. I just perform a very rapid search over the alphabet. This trick is something I learned when I was quite a bit younger, and I still employ to this day.

So, here is the method in detail -- it may sound silly, but trust me, it works pretty well. I simply enumerate over the alphabet and record the letters that click. For example: let's say the word on the tip of my tongue is [Ocampa](http://en.memory-alpha.org/wiki/Ocampa) (Kes' race in ST:Voyager). Here is what I would do:

**Step 1**: Get the first letter/sound by going through the alphabet from A-Z, and selecting the letters or sounds that "fit".

A => Hmm, no

B => Nope...

L => Nah

M => No, no

O => Hmm...yeah, I think it was an "O" sound.

**Step 2**: Get the next letter:

OA => Nah...

OB => No, doesn't sound right

OC => Hmm (this goes in working memory)

OG => Close...but nah, not ringing a bell

OK => Maybe (this also goes in working memory)

OL => Nah, nah, I'm sure it's OC or OK...Let's try that again.

OC => Yeah, I'm sure thats it.

**Step 3**: If you've found the beginning sound cluster, this should be enough for you to play with, and should pop the word off the tip of your tongue.
Something to the effect of: "Ok...Okaba, Ocamba, Ocampa! Ah that's it!"

Programmers should recognize this as a kind of brute-force search (with a bit of heuristics). That's right, you can brute-force your recall!

## Method of Loci and a Bird's Eye View
The Method of Loci, or memory palace, is the go-to of memory champions the world over. There are countless resources out there that explain this method much more clearly and thoroughly than I'm about to; however, this section is *not* about explaining how the method works, but an unanticipated side-effect I noticed while practicing. 

If you aren't familiar with the [Method of Loci](http://en.wikipedia.org/wiki/Method_of_loci), it is a way to memorize massive amounts of data by using associations, familiarity, and the absurd. Essentially, you pick a familiar location, be it real or fictional, and in this location, map out a path with distinct stopping points. At each stopping point, you can store a piece of information: raw, encoded, compressed, or otherwise. The more absurd and outlandish the data representation, the more vividly it's remembered. You might remember a 10 item shopping list by placing the items in 10 distinct stopping points in one of your mental palaces (your childhood home, for example). To recall the data, you just walk the path, and look at each stopping point: Yep, there it is, a box of Raisin Bran hovering above the lamp post at my old home. 

Now, on to the purpose of this section. One thing I noticed about this method, was that the items, being defined in 3-space, are able to be examined and linked from ANY vantage point of your mental model. I'm originally from SE Michigan, and many of the homes in that area have a similar grounds layout. 2-3 story house, with a driveway off to the right, leading from front to backyard. The interior of my old home is designed in such a way, that the staircase landing has a  window that overlooks this driveway. I have a 26 point path in this childhood home, position #4 is in the center of my driveway, and position #20 is the above referenced stair landing. 

When practicing this method, you have to really visualize the location you are using, look at every nook and cranny, get the place as clear as possible in your mind. You have to recreate a fully functional mental model of the location. 
So, when I was first mapping out my 26 points, as I hit spot #20 (the staircase), I happened to look out the window, to the driveway, and lo and behold, without conscious effort, was the item I had placed at location #4. This was as amusing as it was amazing. I then realized that I could go into an aerial view, and sure enough, I could quickly pan around and see every single item as clear as day (bonus points if you learn to wireframe). Of course, I'm just a novice at all of this, as some mnemonist report having thousands of memory palaces, some with hundreds of stopping points, I can only imagine what other things they have discovered. 

###Conclusion
So go out, learn some new [things](http://www.amazon.com/How-To-Clever-Ben-Pridmore/dp/1257099043). You have a pretty cool tool sitting between your ears, use it do a little more than just [program](http://www.amazon.com/Winning-Chess-Three-Moves-Ahead/dp/0671211145) all day! I really enjoy this kind of stuff and would like to hear some other brain hacks you guys know!


**I hate chess in movies. No player worth their salt gets surprise checkmated in 2 moves. Come to think of it, in all my years of tournament play, I could probably count the number of actual checkmates I've seen on one hand. Most games between seasoned players [end](http://en.wikipedia.org/wiki/Glossary_of_chess#Resign) well before that point.
