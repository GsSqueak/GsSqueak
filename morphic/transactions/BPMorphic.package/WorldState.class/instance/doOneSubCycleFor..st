update cycle
doOneSubCycleFor: aWorld
  "Like doOneCycle, but preserves activeHand."

  | currentHand |
  currentHand := SessionTemps current at: #'ActiveHand'.
  self doOneCycleFor: aWorld.
  SessionTemps current at: #'ActiveHand' put: currentHand