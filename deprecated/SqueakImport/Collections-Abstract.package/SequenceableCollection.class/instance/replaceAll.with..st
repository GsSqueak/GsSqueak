accessing
replaceAll: oldObject with: newObject 
	"Replace all occurences of oldObject with newObject"
	
	| index |
	index := 0.
	[ (index := self indexOf: oldObject startingAt: index + 1) = 0 ] 
		whileFalse: [ self at: index put: newObject ]