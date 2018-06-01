displaying
showZoom
	"Decide if user wants a zoom transition, and if there is enough memory to do it."

	^ Preferences projectZoom and:
		"Only show zoom if there is room for both displays plus a megabyte"
		[Smalltalk garbageCollectMost > 
						(Display boundingBox area*displayDepth //8+1000000)]