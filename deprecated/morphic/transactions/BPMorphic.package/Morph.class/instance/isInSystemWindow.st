structure
isInSystemWindow
  "answer if the receiver is in a system window"

  ^ self owner isMorph
    and: [ self owner isSystemWindow or: [ self owner isInSystemWindow ] ]