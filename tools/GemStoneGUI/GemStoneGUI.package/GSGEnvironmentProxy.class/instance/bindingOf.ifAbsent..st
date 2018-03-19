binding
bindingOf: aSymbol ifAbsent: aBlock

	^ self interface environment: self bindingOf: aSymbol ifAbsent: aBlock