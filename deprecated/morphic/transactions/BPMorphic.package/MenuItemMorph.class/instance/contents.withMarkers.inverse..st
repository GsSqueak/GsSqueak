accessing
contents: aString withMarkers: aBool inverse: inverse 
	"Set the menu item entry. If aBool is true, parse aString for embedded
	markers. "
	| _gsSqueakTemp_markerIndex _gsSqueakTemp_marker |
	self contentString: nil.
	"get rid of old"
	aBool
		ifFalse: [^ super contents: aString].
	self removeAllMorphs.
	"get rid of old markers if updating"
	self hasIcon
		ifTrue: [self icon: nil].
	(aString notEmpty
			and: [aString first = $<])
		ifFalse: [^ super contents: aString].
	_gsSqueakTemp_markerIndex := aString indexOf: $>.
	_gsSqueakTemp_markerIndex = 0
		ifTrue: [^ super contents: aString].
	_gsSqueakTemp_marker := (aString copyFrom: 1 to: _gsSqueakTemp_markerIndex) asLowercase.
	(#('<on>' '<off>' '<yes>' '<no>' ) includes: _gsSqueakTemp_marker)
		ifFalse: [^ super contents: aString].
	self contentString: aString.
	"remember actual string"
	_gsSqueakTemp_marker := (_gsSqueakTemp_marker = '<on>'
					or: [_gsSqueakTemp_marker = '<yes>'])
					~= inverse
				ifTrue: [self onImage]
				ifFalse: [self offImage].
	super
		contents: (aString copyFrom: _gsSqueakTemp_markerIndex + 1 to: aString size).
	"And set the marker"
	_gsSqueakTemp_marker := ImageMorph new image: _gsSqueakTemp_marker.
	_gsSqueakTemp_marker position: self left @ (self top + 2).
	self addMorphFront: _gsSqueakTemp_marker