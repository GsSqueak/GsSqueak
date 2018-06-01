C library simulation
str: aString cat: bString 
	"implementation of strcat(3)"
	^ (self asString: aString)
		, (self asString: bString)