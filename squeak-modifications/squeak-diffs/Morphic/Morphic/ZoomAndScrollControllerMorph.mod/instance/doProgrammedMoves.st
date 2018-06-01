as yet unclassified
doProgrammedMoves

	| thisMove startPoint endPoint startZoom endZoom newScale newPoint fractionLeft |

	programmedMoves isEmptyOrNil ifTrue: [
		^programmedMoves := nil
	].
	thisMove := programmedMoves first.
	thisMove at: #pauseTime ifPresent: [ :ignore | ^self].

	fractionLeft := self fractionLeftInMove: thisMove.
	fractionLeft ifNil: [^programmedMoves := programmedMoves allButFirst].

	startPoint := thisMove at: #startPoint ifAbsentPut: [self cameraPoint].
	endPoint := thisMove at: #endPoint ifAbsentPut: [self cameraPoint].

	startZoom := thisMove at: #startZoom ifAbsentPut: [self cameraScale].
	endZoom := thisMove at: #endZoom ifAbsentPut: [self cameraScale].
	newScale := endZoom - (endZoom - startZoom * fractionLeft).
	newPoint := (endPoint - (endPoint - startPoint * fractionLeft)) "rounded".
	target changeScaleTo: newScale.
	target cameraPoint: newPoint.

	fractionLeft <= 0 ifTrue: [^programmedMoves := programmedMoves allButFirst].

