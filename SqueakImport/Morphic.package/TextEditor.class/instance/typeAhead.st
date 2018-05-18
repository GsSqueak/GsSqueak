private
typeAhead
	^ typeAhead ifNil:
		[ self resetTypeAhead.
		typeAhead ]