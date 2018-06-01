geometry
timeForX: aNumber

	^ ((aNumber - bounds left - borderWidth) asFloat / timeScale + leftEdgeTime) asInteger