shared flaps
positionNavigatorAndOtherFlapsAccordingToPreference
	"Lay out flaps along the designated edge right-to-left, possibly
	positioning the navigator flap, exceptionally, on the left."
	| _gsSqueakTemp_ids |
	_gsSqueakTemp_ids := Preferences navigatorOnLeftEdge
				ifTrue: [{'Navigator' translated}]
				ifFalse: [#()].
	Flaps positionVisibleFlapsRightToLeftOnEdge: #bottom butPlaceAtLeftFlapsWithIDs: _gsSqueakTemp_ids
	"Flaps positionNavigatorAndOtherFlapsAccordingToPreference"