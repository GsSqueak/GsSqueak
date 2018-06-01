initialization
flexing: aMorph byTransformation: tfm 
	"Initialize me with position and bounds of aMorph,
	and with an offset that provides centered rotation."
	(aMorph isKindOf: TransformationMorph)
		ifTrue: [aMorph
				submorphsDo: [:m | self addMorph: m clone]]
		ifFalse: [self addMorph: aMorph].
	transform := tfm.
	self chooseSmoothing.
	self layoutChanged