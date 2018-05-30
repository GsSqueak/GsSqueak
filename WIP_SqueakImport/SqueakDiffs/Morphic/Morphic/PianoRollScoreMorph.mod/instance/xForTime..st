geometry
xForTime: aNumber

	^ ((aNumber - leftEdgeTime) asFloat * timeScale) asInteger + bounds left + borderWidth
