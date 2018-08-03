wrapper
sessionIsRemote

	^ [self gciLibrary sessionIsRemote: self]
		on: Error
		do: [:error | -1]