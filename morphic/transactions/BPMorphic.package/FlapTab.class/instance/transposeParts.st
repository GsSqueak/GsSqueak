positioning
transposeParts
	"The receiver's orientation has just been changed from vertical to
	horizontal or vice-versa."
	"First expand the flap to screen size, letting the submorphs lay out to
	fit, and then shrink the minor dimension back to the last row."
	self isCurrentlyTextual
		ifTrue: ["First recreate the tab with proper orientation"
			self
				assumeString: self existingWording
				font: Preferences standardFlapFont
				orientation: self orientation
				color: self color].
	self orientation == #vertical
		ifTrue: ["changed from horizontal"
			referent listDirection: #topToBottom;
				 wrapDirection: #leftToRight.
			referent hasSubmorphs
				ifTrue: [referent extent: self currentWorld extent.
					referent fullBounds.
					"Needed to trigger layout"
					referent width: (referent submorphs
							collect: [:m | m right]) max - referent left + self width]]
		ifFalse: [referent listDirection: #leftToRight;
				 wrapDirection: #topToBottom.
			referent hasSubmorphs
				ifTrue: [referent extent: self currentWorld extent.
					referent fullBounds.
					"Needed to trigger layout"
					referent height: (referent submorphs
							collect: [:m | m bottom]) max - referent top + self height]].
	referent hasSubmorphs
		ifFalse: [referent extent: 100 @ 100].
	self spanWorld.
	flapShowing
		ifTrue: [self showFlap]