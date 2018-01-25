instruction decoding
storeIntoLiteralVariable: value 
	"Simulate the action of bytecode that stores the top of the stack into a 
	literal variable of my method."

	self object: value instVarAt: ValueIndex put: self top