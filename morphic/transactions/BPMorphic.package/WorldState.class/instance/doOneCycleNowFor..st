update cycle
doOneCycleNowFor: aWorld
  "Immediately do one cycle of the interaction loop.
	This should not be called directly, but only via doOneCycleFor:"

  | capturingGesture |
  DisplayScreen checkForNewScreenSize.
  capturingGesture := false.	"self flag: #bob.	"	"need to consider remote hands in lower worlds"	"process user input events"
  SessionTemps current
    at: #'WorldStateLastCycleTime'
    put: Time millisecondClockValue.
  self
    handsDo: [ :h | 
      SessionTemps current at: #'ActiveHand' put: h.
      h processEvents.
      capturingGesture := capturingGesture or: [ h isCapturingGesturePoints ].
      SessionTemps current at: #'ActiveHand' put: nil ].	"the default is the primary hand"	"	ActiveHand := self hands first. TODO: hack"	"The gesture recognizer needs enough points to be accurate.
	Therefore morph stepping is disabled while capturing points for the
	recognizer "
  capturingGesture
    ifFalse: [ 
      aWorld runStepMethods.	"there are currently some variations here"
      self displayWorldSafely: aWorld ]