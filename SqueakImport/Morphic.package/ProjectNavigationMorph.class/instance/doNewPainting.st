the actions
doNewPainting
	
	| w f |

	w := self world.
	w assureNotPaintingElse: [^ self].
	(f := self owner flapTab) ifNotNil: [f hideFlap].
	w makeNewDrawing: (self primaryHand lastEvent copy setPosition: w center)
