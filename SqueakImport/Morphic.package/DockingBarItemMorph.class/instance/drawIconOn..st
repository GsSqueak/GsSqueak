drawing
drawIconOn: aCanvas 

	| pos |
	self hasIcon ifTrue: [
		| iconForm | 
		iconForm := self iconForm.

		pos := (contents
			ifEmpty: [self left + (self width - iconForm width // 2)]
			ifNotEmpty: [self left])
				@ (self top + (self height - iconForm height // 2)).

		aCanvas
			translucentImage: iconForm 
			at: pos].