world state
install
  owner := nil.	"since we may have been inside another world previously"
  SessionTemps current at: #'ActiveWorld' put: self.
  SessionTemps current at: #'ActiveHand' put: self hands first.	"default"
  SessionTemps current at: #'ActiveEvent' put: nil.
  submorphs
    do: [ :ss | 
      ss owner isNil
        ifTrue: [ ss privateOwner: self ] ].	"Transcript that was in outPointers and then got deleted."
  self viewBox: (SessionTemps current at: #'Display') boundingBox.
  (SessionTemps current at: #'Sensor') flushAllButDandDEvents.
  worldState handsDo: [ :h | h initForEvents ].
  self installFlaps.
  self borderWidth: 0.	"default"
  (Preferences showSecurityStatus
    and: [ SecurityManager default isInRestrictedMode ])
    ifTrue: [ 
      self
        borderWidth: 2;
        borderColor: Color red ].
  self presenter allExtantPlayers do: [ :player | player prepareToBeRunning ].
  SystemWindow noteTopWindowIn: self