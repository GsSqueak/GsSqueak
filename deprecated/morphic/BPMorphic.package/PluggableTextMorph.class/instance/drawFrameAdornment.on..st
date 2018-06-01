drawing
drawFrameAdornment: aColor on: aCanvas 
	"Indicate edit status for the text editor"
	self class simpleFrameAdornments
		ifTrue: [aCanvas
				frameRectangle: self innerBounds
				width: (self
						valueOfProperty: #frameAdornmentWidth
						ifAbsent: [1])
				color: aColor.
			aCanvas
				frameRectangle: (self innerBounds insetBy: 1)
				width: (self
						valueOfProperty: #frameAdornmentWidth
						ifAbsent: [1])
				color: (aColor alpha: aColor alpha / 3.0)]
		ifFalse: [| form |
			"Class-side adornment cache is currently using pre-multiplied
			alpha, so we need to use rule 34 which works for < 32bpp,
			too. "
			form := self class adornmentWithColor: aColor.
			aCanvas
				image: form
				at: self innerBounds topRight - (form width @ 0)
				sourceRect: form boundingBox
				rule: 34]