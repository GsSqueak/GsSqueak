show & hide
showFlap
	"Open the flap up"
	"19 sept 2000 - going for all paste ups <- raa note"
	| _gsSqueakTemp_thicknessToUse _gsSqueakTemp_flapOwner |
	_gsSqueakTemp_flapOwner := self pasteUpMorph.
	self referentThickness <= 0
		ifTrue: [_gsSqueakTemp_thicknessToUse := lastReferentThickness
						ifNil: [100].
			self orientation == #horizontal
				ifTrue: [referent height: _gsSqueakTemp_thicknessToUse]
				ifFalse: [referent width: _gsSqueakTemp_thicknessToUse]].
	inboard
		ifTrue: [self stickOntoReferent].
	"makes referent my owner, and positions me accordingly"
	referent pasteUpMorph == _gsSqueakTemp_flapOwner
		ifFalse: [_gsSqueakTemp_flapOwner accommodateFlap: self.
			"Make room if needed"
			_gsSqueakTemp_flapOwner addMorphFront: referent.
			_gsSqueakTemp_flapOwner startSteppingSubmorphsOf: referent.
			self positionReferent.
			referent adaptToWorld: _gsSqueakTemp_flapOwner].
	inboard
		ifFalse: [self adjustPositionVisAVisFlap].
	flapShowing := true.
	self pasteUpMorph hideFlapsOtherThan: self ifClingingTo: edgeToAdhereTo.
	_gsSqueakTemp_flapOwner bringTopmostsToFront