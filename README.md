# Reel Rich: Scratch & Sinker
### Game Design Document

---

## Table of Contents
1. [Introduction](#1-introduction)
2. [Gameplay](#2-gameplay)
3. [Game Mechanics](#3-game-mechanics)
4. [Lore](#4-lore)

---

## 1. Introduction

**Reel Rich: Scratch & Sinker** Reel Rich: Scratch & Sinker is a darkly comedic semi-idle fishing game about a broke fisherman who makes a deal he can't afford and spends the rest of his lives trying to outlast it. Players fish, gamble, feed an ancient eldritch patron, and die, repeatedly, in pursuit of endless wealth and just one more cast.

---

## 2. Gameplay

Catch fish. Scratch scales. Pray the symbols line up. Reel Rich's core loop is built around the satisfying tension of a scratch-off ticket, except the ticket is a fish, the prize is gold coins, and the house is an eldritch ocean god with an appetite. Prestige unlocks new bait catalogues, escalating the stakes with every run.

### Gameplay Loop

```
Buy Bait
	↓
Cast Line
	↓
Catch Fish
	↓
Scratch Fish
	↓
Choose What To Keep
	↓
Choose What To Feed Patron
	↓
Manage Hunger
	↓
Acquire Artifacts
	↓
Accept or Reject Patron Deals
	↓
Die or Cash Out
	↓
Prestige
	↓
Repeat
```

---

## 3. Game Mechanics

### Bait Shop
Where the player receives the bait used for their run. For specific, carnivorous fish types, food may be required to buy the bait.

### Bait Catalogue
A set of bait available for purchase. More catalogues are unlocked after each prestige.

### Bait
Bait is bought to catch a specific fish. For example, minnow bait catches only minnows.

### Bait Bucket *(Inventory)*
Bait is thrown into a top-down view of a box with light physics. The player can drag and drop the bait around and place it either in a chum bucket or onto the fishing line to catch fish.

### Fish Cooler *(Inventory)*
Can hold food for buying fish bait and for feeding the patron.

### Chum Bucket *(Unlockable Gadget — Subject to Change)*
The player drags and drops bait onto the bucket for the chance to catch more than one fish in a single cast.

### Casting
To cast the line, the player drags and drops bait onto the line.

### Catching *(Placeholder)*
A quick-action event minigame. The player can either catch the fish or lose their bait.

### Processing
The player descales the fish to reveal the scratch-off symbols. If the symbols align to a win, the fish blows up into gold coins and sometimes artifacts and ingredients used to satisfy the patron further.

### Fish
Each fish has separate odds, number of symbols, win conditions, bonuses, jackpots, experience, levels, and a gameplay gimmick. Each time a player catches a certain fish, the bait used gains experience. When the experience reaches a certain threshold, the fish levels up and receives a multiplier buff. Each fish can drop coins, artifacts, and food for the patron. Patron food is obtained by *not* scratching off the fish scales.

### Rare Fish Events
A huge fish triggers a quick-action event that can be lost very quickly. The player receives a massive reward and each unlocked fish bait levels up twice. *(Allows for over-leveling.)*

### Patron
The Patron consumes the winnings of the player in the form of ingredients, artifacts, and money found inside caught fish. As time passes and more upgrades are purchased, the patron becomes hungrier. The hungrier the patron is, the better rewards the player receives. The patron will occasionally request a certain fish type.

As the Patron's hunger nears its maximum, the screen starts to darken with tendrils along the borders of each panel. The player is given a pop-up text or voice line:

> *"You've kept me waiting long enough."*

When hunger reaches its maximum, the Patron kills the player.

### Prestige
The player dies and comes back to where they started, but with new powers that can be bought in the afterlife with prestige coins.

### Prestige Coins *(Working Name: Patron's Favor)*
Prestige coins are earned as the player accumulates money and satisfies the patron. They are only received after the player sacrifices themselves (cashes out) before being consumed by the patron.

The amount earned is determined by:
- How far the player progressed in their current life
- How many total prestige coins they've earned on their save file

The more coins already earned, the fewer coins received in early-stage runs — keeping each prestige feeling meaningful without runaway scaling.

### Meta Progression
Unlockable abilities earned through prestiging. There are three skill trees:

- **Fisherman** — fishing efficiency and catch improvements
- **Patron** — hunger management and deal bonuses
- **Death** — prestige and afterlife upgrades

*(Specific upgrades TBD)*

### Gadgets & Spells *(Add More)*
Upgrades for the playing field, including:
- Auto-fisher
- Auto-buyer
- Auto-collector
- Auto-scaler
- Timed luck-up
- Summon Clouds spell

### Upgrades
Increase the efficiency of gadgets. Includes:
- Gadget capacity and speed
- Scaling knife strength and size
- Catch size (amount of fish caught per bait)

### Artifacts
Artifacts can either:
- Boost player stats for a short time, or
- Feed the patron for far more than coins or fish would

### Corruption
Upon feeding the patron an artifact, the player is offered a choice of three patron deals — permanent for their current life. Each deal has a positive and a negative effect. Examples:
Upon feeding the patron an artifact, the player is offered a choice of three patron deals, permanent for their current life. Each deal has a positive and a negative effect. Examples:

| Positive | Negative |
|---|---|
| 2x jackpots | 2x bait costs |
| +100% fish value | Patron hunger increases 50% faster |

Each deal is paired with a patron voice line or text.

---

## 4. Lore

> *To be voiced in the style of the Resident Evil Village opening.*

---

### The Setup

You weren't always this bad at quitting while you were ahead. Once you were just a fisherman — a decent one, even. But the cards called louder than the sea ever did, and somewhere between your third loan and your fifth eviction notice, the sea decided to answer back.
You weren't always this bad at quitting while you were ahead. Once you were just a fisherman, a decent one, even. But the cards called louder than the sea ever did, and somewhere between your third loan and your fifth eviction notice, the sea decided to answer back.

The night you cast your line with nothing left to lose, something bit. Not a fish. Something older. Something that had been watching the bottom of every bottle and the back of every losing ticket you'd ever held, waiting for the moment you had absolutely nothing left to bargain with.

That's when it makes the best deals.

---

### The Pact

You don't remember signing anything. You don't remember agreeing to anything. But you woke up on your boat with full pockets, a strange knife that hums when it touches scales, and a voice in the back of your head that sounds like the ocean gargling gold coins.

The terms were simple, as far as you understood them:

> You fish.
> It feeds.
> When it's done with you, you die.

The good news is you're very motivated to delay that last part.

---

### The Patron

Nobody knows what it is. Nobody who's met it has had the luxury of writing it down. Ancient sailors called it a hundred different names in a hundred different languages, none of which your tongue could form correctly anyway. The scratched inscription on your knife just reads **[ ?????? ]**.

It is enormous. It is patient. It finds you deeply, deeply amusing.

<<<<<<< HEAD
It speaks to you like a theater producer watches a one-man show — entertained, a little bored, completely in control. It gave you the power to turn your catches into something worth gambling on not out of generosity, no, but because a well-fed fisherman fishes longer. And the longer you fish, the longer it eats.
=======
It speaks to you like a theater producer watches a one-man show — entertained, a little bored, completely in control. It gave you the power to turn your catches into something worth gambling on not out of generosity, no,but because a well-fed fisherman fishes longer. And the longer you fish, the longer it eats.
>>>>>>> c09607dd1476e21ffe7f8c0e91e4c362e387775e

It will remind you of this. Frequently. Dramatically.

---

### The Loop *(In-Universe)*

Every time the Patron's hunger peaks and it finally loses patience with you, it consumes you. But death, it turns out, is negotiable — at a price. In the afterlife you spend what little favor you've earned on new abilities, new knowledge, new tricks. Then it spits you back out at the start, hungrier than before, because of course it is.

You've done this before. You'll do it again. The Patron finds this hilarious.

You're starting to see the joke.

---

### Intro Animation Script

---

**[Visuals: Nothing. Black screen.]**
*The Patron's voice comes from everywhere and nowhere. Smooth. Theatrical. Ancient.*

**PATRON:**
"I have watched civilizations dissolve into my waters."

*[Beat.]*

"Empires. Gods. Things older than your language has words for."

*[Beat. Almost playful.]*

"And yet..."

*[The camera drifts upward through dark water toward a faint light above.]*

"...here I am."

"Talking to you."

---

**[Visuals: Dark night. The surface of the water. A fishing line drops in from above. Pathetic. Thin.]**

**PATRON:**
"You were not special."

*[Pause.]*

"I want to be very clear about that."

*[The line sinks past the camera. The Patron watches it the way a man watches a fly land on his sleeve.]*

"You were broke. You were desperate. You smelled faintly of losing tickets and cheaper whiskey."

*[Beat.]*

"You were, in every measurable sense..."

*[Pause — almost fond.]*

"...perfect."

---

**[Visuals: The golden eyes open. All of them. Slowly. Filling the dark water.]**

**PATRON:**
"I have made many deals."

"Sailors. Kings. Men who thought themselves clever."

*[A dry, resonant sound — almost a laugh.]*

"They were not clever."

*[Pause.]*

"You are also not clever."

"But you are entertaining."

"And I have been down here..."

*[Beat.]*

"...for a very long time."

**[Visuals: Fade to black.]**

---

**[Visuals: The player waking up on the boat. The Patron watching from below.]**

**PATRON:**
"The terms are generous. By my standards."

"You fish. I eat. You get your little coins."

*[Pause — theatrical sigh.]*

"And when I grow tired of waiting..."

*[The tendrils begin creeping at the edges of the frame.]*

"Well."

*[Beat.]*

"You've read the fine print."

*[Pause.]*

"...You didn't read the fine print."

*[Amused.]*

"Of course you didn't."

**[Game: Tutorial begins.]**

---

**[Game Event: Upon Opening Inventory for the First Time]**

**[Visuals: The knife gleaming. The inscription. [ ?????? ]]**

**PATRON:**
"You will die, little fisherman."

*[Pause — almost warmly.]*

"Probably several times."

"You will come back. You will fish again. You will push further than you should because that is simply what you are."

*[Beat.]*

"And I will be here."

"Waiting."

"Eating."

*[The golden eyes gleam.]*

"...Watching."

---

**[Game Event: Upon Scaling the First Fish]**

**[Visuals: The player scales the first fish. The coin explodes outward. His eyes light up.]**

**PATRON:**
"Ah."

*[Quiet. Satisfied.]*

"There it is."

*[Pause.]*

"That look."

*[The Patron's voice drops — quieter, genuine for just a moment.]*

"They all make that face."

*[Then back to theatrical.]*

"Now then."

*[Beat.]*

"Fish."

**[Game: Fish explodes into coins, added to the player's wallet.]**

---

**[Visuals: Title card slams in from behind the remains of the fish.]**

# REEL RICH: Scratch & Sinker

**[Visuals: Title card fades out.]**
