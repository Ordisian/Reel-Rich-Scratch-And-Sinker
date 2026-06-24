extends Node

## Main.gd
## Orchestrates the sequence: Cast (RodPanel) -> Reel (ReelMinigame) ->
## Scratch (ScratchPanel) -> back to idle. Each step is its own panel/
## script; this just wires the hand-offs between them.
