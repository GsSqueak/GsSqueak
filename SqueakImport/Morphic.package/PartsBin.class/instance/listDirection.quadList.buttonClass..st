initialization
listDirection: aListDirection quadList: quadList buttonClass: buttonClass
	"Initialize the receiver to run horizontally or vertically, obtaining its elements from the list of tuples of the form:
		(<receiver> <selector> <label> <balloonHelp>)
	Used by external package Connectors."

	self layoutPolicy: TableLayout new.
	self listDirection: aListDirection.
	self wrapCentering: #topLeft.
	self layoutInset: 2.
	self cellPositioning: #bottomCenter.

	aListDirection == #leftToRight
		ifTrue:
			[self vResizing: #rigid.
			self hResizing: #spaceFill.
			self wrapDirection: #topToBottom]
		ifFalse:
			[self hResizing: #rigid.
			self vResizing: #spaceFill.
			self wrapDirection: #leftToRight].
	quadList do:
		[:tuple |
			| aButton aClass |
			aClass := Smalltalk at: tuple first.
			aButton := buttonClass new initializeWithThumbnail: (self class thumbnailForQuad: tuple color: self color) withLabel: tuple third andColor: self color andSend: tuple second to: aClass.
			(tuple size > 3 and: [tuple fourth isEmptyOrNil not]) ifTrue:
				[aButton setBalloonText: tuple fourth].
 			self addMorphBack: aButton]