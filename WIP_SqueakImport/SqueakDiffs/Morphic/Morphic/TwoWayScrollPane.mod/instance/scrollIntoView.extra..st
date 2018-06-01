geometry
scrollIntoView: desiredRectangle extra: anumber
	| shift |

	shift := desiredRectangle deltaToEnsureInOrCentered: (
		scroller offset extent: scroller bounds extent
	)  extra: anumber.
	shift = (0 @ 0) ifFalse: [self scrollBy: (0@0) - shift].
