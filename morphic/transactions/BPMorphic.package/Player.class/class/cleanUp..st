housekeeping
cleanUp: aggressive 
	"Nuke uni-classes when aggressively cleaning up"
	aggressive
		ifTrue: [self
				withAllSubclassesDo: [:aClass | aClass isUniClass
						ifTrue: [Smalltalk removeClassNamed: aClass name]]]