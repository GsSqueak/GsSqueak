structure
isInDockingBar
  "answer if the receiver is in a menu bar"

  ^ self owner notNil and: [ self owner isDockingBar ]