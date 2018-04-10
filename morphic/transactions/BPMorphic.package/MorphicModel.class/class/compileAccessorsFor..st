compilation
compileAccessorsFor: varName 
	self
		compile: ('&var
	"Return the value of &var"
	^ &var' copyReplaceAll: '&var' with: varName)
		classified: 'public access'
		notifying: nil.
	self
		compile: ('&varPut: newValue
	"Assign newValue to &var.
	Add code below to update related graphics appropriately..."

	&var := newValue.' copyReplaceAll: '&var' with: varName)
		classified: 'public access'
		notifying: nil.
	self
		compile: ('&var: newValue
	"Assigns newValue to &var and updates owner"
	&var := newValue.
	self propagate: &var as: ''&var:''' copyReplaceAll: '&var' with: varName)
		classified: 'private - propagation'
		notifying: nil