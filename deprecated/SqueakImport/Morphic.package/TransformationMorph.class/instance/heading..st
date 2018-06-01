geometry eToy
heading: newHeading
 "If we have a rendee set its heading. Else do nothing." 

| rendee |
( rendee := self renderedMorph) == self ifTrue: [ ^ self  ] .
	^rendee heading: newHeading