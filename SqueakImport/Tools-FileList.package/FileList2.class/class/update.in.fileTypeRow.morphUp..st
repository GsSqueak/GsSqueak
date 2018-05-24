morphic ui
update: actionRow in: window fileTypeRow: fileTypeRow morphUp: morph

	| fileTypeInfo info2 buttons textColor1 fileSuffixes fileActions aFileList fileTypeString |

	(morph notNil and:[(morph valueOfProperty: #enabled) not]) ifTrue: [^self].
	fileTypeRow submorphsDo: [ :sub |
		sub color: (
			sub == morph 
				ifTrue: [Color white] 
				ifFalse: [(sub valueOfProperty: #enabled) 
							ifTrue: [Color transparent] ifFalse: [Color gray]]
		).
	].
	fileTypeString := morph isNil ifTrue:['xxxx'] ifFalse:[morph valueOfProperty: #buttonText].

	aFileList := window valueOfProperty: #FileList.
	textColor1 := Color r: 0.742 g: 0.839 b: 1.0.
	actionRow removeAllMorphs.
	fileTypeInfo := self endingSpecs.
	info2 := fileTypeInfo detect: [ :each | each first = fileTypeString] ifNone: [ nil ].
	info2 isNil
		ifTrue:[
			buttons := OrderedCollection new
		]
		ifFalse:[
			fileSuffixes := info2 second.
			fileActions := info2 third.
			buttons := fileActions collect: [ :each | aFileList blueButtonForService: each textColor: textColor1 inWindow: window ].
			buttons do: [ :each |
				each fillWithRamp: Color lightGreen oriented: (0.75 @ 0).
			].
		].
	buttons addLast: (self
								blueButtonText: 'Cancel'
								textColor: textColor1
								color: Color lightRed
								inWindow: window
								balloonText: 'Cancel this search' selector: #cancelHit recipient: aFileList).
	buttons do: [ :each | actionRow addMorphBack: each].
	window fullBounds.
	fileSuffixes isNil ifFalse:[
		aFileList fileSelectionBlock: (
			self selectionBlockForSuffixes: (fileSuffixes collect: [ :each | '*.',each])
		).
	].
	aFileList updateFileList.