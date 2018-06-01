shared flaps
positionNavigatorAndOtherFlapsAccordingToPreference
	"Lay out flaps along the designated edge right-to-left, possibly positioning the navigator flap, exceptionally, on the left."

	| ids |
	ids := Preferences navigatorOnLeftEdge ifTrue: [{'Navigator' translated}] ifFalse: [#()].

	Flaps positionVisibleFlapsRightToLeftOnEdge: #bottom butPlaceAtLeftFlapsWithIDs: ids

"Flaps positionNavigatorAndOtherFlapsAccordingToPreference"