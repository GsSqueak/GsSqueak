misc
playPageFlipSound: soundName
  self presenter ifNil: [ ^ self ].	"Avoid failures when called too early"
  PageFlipSoundOn
    ifTrue: [ 
      "mechanism to suppress sounds at init time"
      "self playSoundNamed: soundName"
       ]