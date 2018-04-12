accessing
lineColor
	"Answer a good color to use for drawing the lines that connect
	members of the hierarchy view.
	Used the cached color, or derive it if necessary by finding the first
	owner (up to my root) that is not transparent, then picking a
	contrasting color.
	Fall back to veryLightGray if all my owners are transparent."
	| _gsSqueakTemp_coloredOwner _gsSqueakTemp_targetLuminance _gsSqueakTemp_ownerColor _gsSqueakTemp_darken |
	lineColor
		ifNotNil: [^ lineColor].
	_gsSqueakTemp_coloredOwner := self
				firstOwnerSuchThat: [:o | o isWorldOrHandMorph not
						and: [o color isTransparent not]].
	_gsSqueakTemp_coloredOwner
		ifNil: [^ Color veryLightGray].
	_gsSqueakTemp_ownerColor := _gsSqueakTemp_coloredOwner color.
	_gsSqueakTemp_darken := _gsSqueakTemp_ownerColor luminance > 0.5.
	_gsSqueakTemp_targetLuminance := _gsSqueakTemp_ownerColor luminance
				+ (_gsSqueakTemp_darken
						ifTrue: [-0.2]
						ifFalse: [0.2]).
	^ _gsSqueakTemp_darken
		ifTrue: [_gsSqueakTemp_ownerColor atMostAsLuminentAs: _gsSqueakTemp_targetLuminance]
		ifFalse: [_gsSqueakTemp_ownerColor atLeastAsLuminentAs: _gsSqueakTemp_targetLuminance]