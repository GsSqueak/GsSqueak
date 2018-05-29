private
screenForm
	| screenImage colorMap pickValue elseValue |
	screenForm ifNotNil: [^screenForm].
	passElseBlock ifNil: [passElseBlock := true].
	passingColor ifNil: [passingColor := Color black].
	elseValue := passElseBlock 
		ifTrue: 
			[pickValue := 4294967295.
			 0]
		ifFalse: 
			[pickValue := 0.
			 4294967295].
	screenImage := self screenMorph 
				imageFormForRectangle: self screenMorph bounds.
	colorMap := screenImage newColorMap atAllPut: elseValue.
	colorMap at: (passingColor indexInMap: colorMap) put: pickValue.
	screenForm := Form extent: screenImage extent.
	screenForm 
		copyBits: screenForm boundingBox
		from: screenImage
		at: 0 @ 0
		colorMap: colorMap.
	^screenForm