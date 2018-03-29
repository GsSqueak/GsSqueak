internal interpreter access
argumentCountOfClosure: closurePointer 
	"for Cogit"
	^ self quickFetchInteger: ClosureNumArgsIndex ofObject: closurePointer