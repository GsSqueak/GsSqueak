error handling
ambiguousSelector: aString inRange: anInterval 
	"Compile with backward compatibility: $- is part of literal argument.."
	token := token asSymbol