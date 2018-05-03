initialization
initialize
  "initialize the state of the receiver"

  self halt.
  super initialize.	""
  self setInitialState.
  self pages: OrderedCollection new.
  self showPageControls.
  self class turnOffSoundWhile: [ self insertPage ]