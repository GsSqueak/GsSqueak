replacement
replacePartSatisfying: elementBlock inGlobalFlapWithID: aFlapID with: replacement 
	"If a global flapl exists with the given flapID, look in it for a part
	satisfying elementBlock; if such a part is found, replace it with the
	replacement morph, make sure the flap's layout is made right, etc."
	^ self
		replacePartSatisfying: elementBlock
		inGlobalFlapSatisfying: [:fl | fl flapID = aFlapID]
		with: replacement