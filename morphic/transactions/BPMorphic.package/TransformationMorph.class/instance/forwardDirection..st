geometry eToy
forwardDirection: degrees 
	"If we have a rendee set its forward direction. Else do nothing."
	| _gsSqueakTemp_rendee |
	(_gsSqueakTemp_rendee := self renderedMorph) == self
		ifTrue: [^ self].
	^ _gsSqueakTemp_rendee forwardDirection: degrees