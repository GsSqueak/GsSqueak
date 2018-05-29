accessing
bindingOf: varName

	^ self _env0 associationAt: varName ifAbsent: nil
