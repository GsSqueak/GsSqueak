accessing
bindingOf: varName

	^ self _env0 associationAt: varName asSymbol ifAbsent: nil
