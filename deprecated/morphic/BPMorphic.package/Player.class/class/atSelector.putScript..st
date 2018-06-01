scripts
atSelector: aSelector putScript: aMethodWithInterface 
	"Place the given method interface in my directory of scripts, at the
	given selector"
	self scripts at: aSelector asSymbol put: aMethodWithInterface