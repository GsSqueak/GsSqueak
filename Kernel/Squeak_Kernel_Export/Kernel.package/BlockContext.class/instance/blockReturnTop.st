instruction decoding
blockReturnTop
	"Simulate the interpreter's action when a ReturnTopOfStack bytecode is 
	encountered in the receiver."

	| save dest |
	save := home.	"Needed because return code will nil it"
	dest := self return: self pop from: self.
	home := save.
	sender := nil.
	^ dest