balloon compatibility
transformBy:aMatrix
	("aMatrix isPureTranslation" false) ifTrue:[
		target translate:aMatrix offset negated.
	] ifFalse:[
		target  concat:aMatrix.
	].
	^self.
