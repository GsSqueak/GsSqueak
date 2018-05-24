private
includesParameter: parName
	"Return if the parameter named parName exists."
	^self parameters
		includesKey: parName asUppercase