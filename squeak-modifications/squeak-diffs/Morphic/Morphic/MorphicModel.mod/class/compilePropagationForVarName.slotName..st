compilation
compilePropagationForVarName: varName slotName: slotName
	self compile: ((
'&slot&var: newValue
	"The value of &var in &slot has changed to newValue.
	This value can be read elsewhere in code with
		&slot &var
	and it can be stored into with
		&slot &varPut: someValue"

	"Add code for appropriate response here..."'
			copyReplaceAll: '&var' with: varName)
			copyReplaceAll: '&slot' with: slotName)
		classified: 'input events' notifying: nil.
