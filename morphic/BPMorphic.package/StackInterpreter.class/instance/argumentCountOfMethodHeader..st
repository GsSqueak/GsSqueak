compiled methods
argumentCountOfMethodHeader: header 
	^ header >> MethodHeaderArgCountShift bitAnd: 15