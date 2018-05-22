geometry testing
containsPoint: aPoint

	^ (self bounds containsPoint: aPoint) and:
	  [(self rotatedForm isTransparentAt: aPoint - bounds origin) not]
