geometry eToy
forwardDirection: degrees
 "If we have a rendee set its forward direction. Else do nothing." 

| rendee |
( rendee := self renderedMorph) == self ifTrue: [ ^ self  ] .
	^rendee forwardDirection: degrees