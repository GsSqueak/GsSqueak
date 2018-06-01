e-toy support
wrappedInWindowWithTitle: aTitle
	| aWindow w2 |
	aWindow := (SystemWindow labelled: aTitle) model: Model new.
	aWindow addMorph: self frame: (0@0 extent: 1@1).
	w2 := aWindow borderWidth * 2.
	w2 := 3.		"oh, well"
	aWindow extent: self fullBounds extent + (0 @ aWindow labelHeight) + (w2 @ w2).
	^ aWindow