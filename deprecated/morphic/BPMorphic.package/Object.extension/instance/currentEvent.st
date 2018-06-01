*BPMorphic
currentEvent
  "Answer the current Morphic event.  This method never returns nil."

  ^ SessionTemps current
    at: #'ActiveEvent'
    ifAbsent: [ self currentHand lastEvent ]