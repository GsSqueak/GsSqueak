drawing
fullDrawOn: aCanvas 
	| mergeForm |
	submorphs isEmpty ifTrue: [^super fullDrawOn: aCanvas].
	(aCanvas isVisible: self fullBounds) ifFalse: [^self].
	(submorphs size = 1 or: [displayMode == #showScreenOnly]) 
		ifTrue: [^aCanvas fullDrawMorph: self screenMorph].
	displayMode == #showSourceOnly 
		ifTrue: [^aCanvas fullDrawMorph: self sourceMorph].
	displayMode == #showScreenOverSource 
		ifTrue: 
			[aCanvas fullDrawMorph: self sourceMorph.
			^aCanvas fullDrawMorph: self screenMorph].
	displayMode == #showScreened 
		ifTrue: 
			[aCanvas fullDrawMorph: self screenMorph.
			self flag: #fixCanvas.	"There should be a more general way than this"
			mergeForm := self sourceMorph 
						imageFormForRectangle: self screenMorph bounds.
			(BitBlt toForm: mergeForm) 
				copyForm: self screenForm
				to: 0 @ 0
				rule: Form and
				colorMap: (Bitmap with: 0 with: 4294967295).
			aCanvas paintImage: mergeForm at: self screenMorph position]