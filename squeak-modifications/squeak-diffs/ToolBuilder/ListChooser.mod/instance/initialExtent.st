building
initialExtent

	| listFont |
	listFont := Preferences standardListFont.
	^ (20 * (listFont widthOf: $m))@(15 * listFont height)