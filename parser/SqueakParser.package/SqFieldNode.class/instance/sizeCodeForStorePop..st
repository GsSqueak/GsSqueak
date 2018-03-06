code generation
sizeCodeForStorePop: encoder 
	^ (self sizeCodeForStore: encoder)
		+ encoder sizePop