initialization
effect: effectSymbol direction: dirSymbol inverse: inverse
	| invEffect invDir i dirSet |
	inverse ifFalse: [^ self effect: effectSymbol direction: dirSymbol].

	invEffect := effectSymbol.
	effectSymbol = #pageForward ifTrue: [invEffect := #pageBack].
	effectSymbol = #pageBack ifTrue: [invEffect := #pageForward].
	effectSymbol = #slideOver ifTrue: [invEffect := #slideAway].
	effectSymbol = #slideAway ifTrue: [invEffect := #slideOver].

	invDir := dirSymbol.
	dirSet := self directionsForEffect: effectSymbol.
	(i := dirSet indexOf: dirSymbol) > 0
		ifTrue: [invDir := dirSet atWrap: i + (dirSet size // 2)].

	^ self effect: invEffect direction: invDir