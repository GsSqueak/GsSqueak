binding
hideBinding: aBinding 
	(bindings bindingOf: aBinding key)
			== aBinding
		ifFalse: [^ self].
	self undeclare: aBinding key from: bindings