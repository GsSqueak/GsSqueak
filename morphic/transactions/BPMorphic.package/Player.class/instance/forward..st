scripts-standard
forward: dist 
	"Move forward (viz. in the direction of my heading) by the given
	amount "
	| _gsSqueakTemp_rho _gsSqueakTemp_radians _gsSqueakTemp_delta _gsSqueakTemp_didStray _gsSqueakTemp_p _gsSqueakTemp_aCostume _gsSqueakTemp_aPlayfield |
	(_gsSqueakTemp_aCostume := self costume) isInWorld
		ifFalse: [^ self].
	_gsSqueakTemp_aCostume isWorldOrHandMorph
		ifTrue: [^ self].
	_gsSqueakTemp_aCostume owner isHandMorph
		ifTrue: [^ self].
	_gsSqueakTemp_rho := (_gsSqueakTemp_aCostume asNumber: dist) asFloat.
	_gsSqueakTemp_radians := (self getHeadingUnrounded asFloat - 90.0) degreesToRadians.
	_gsSqueakTemp_delta := _gsSqueakTemp_radians cos @ _gsSqueakTemp_radians sin * _gsSqueakTemp_rho.
	(_gsSqueakTemp_aPlayfield := _gsSqueakTemp_aCostume pasteUpMorph) fenceEnabled
		ifTrue: [(_gsSqueakTemp_aPlayfield bounds containsRect: _gsSqueakTemp_aCostume bounds)
				ifFalse: ["If I stray out of the bounds of my playfield, pull me
					back, but
					without changing my heading as bounce would. Do
					nothing if
					bounce has already corrected the direction."
					_gsSqueakTemp_didStray := false.
					((_gsSqueakTemp_aCostume left < _gsSqueakTemp_aPlayfield left
								and: [_gsSqueakTemp_delta x < 0])
							or: [_gsSqueakTemp_aCostume right > _gsSqueakTemp_aPlayfield right
									and: [_gsSqueakTemp_delta x > 0]])
						ifTrue: [_gsSqueakTemp_delta := _gsSqueakTemp_delta x negated @ _gsSqueakTemp_delta y.
							_gsSqueakTemp_didStray := true].
					((_gsSqueakTemp_aCostume top < _gsSqueakTemp_aPlayfield top
								and: [_gsSqueakTemp_delta y < 0])
							or: [_gsSqueakTemp_aCostume bottom > _gsSqueakTemp_aPlayfield bottom
									and: [_gsSqueakTemp_delta y > 0]])
						ifTrue: [_gsSqueakTemp_delta := _gsSqueakTemp_delta x @ _gsSqueakTemp_delta y negated.
							_gsSqueakTemp_didStray := true].
					(_gsSqueakTemp_didStray
							and: [Preferences fenceSoundEnabled])
						ifTrue: [_gsSqueakTemp_aCostume makeFenceSound]]].
	"use and record the fractional position"
	_gsSqueakTemp_p := _gsSqueakTemp_aCostume referencePosition + _gsSqueakTemp_delta.
	_gsSqueakTemp_aCostume referencePosition: _gsSqueakTemp_p