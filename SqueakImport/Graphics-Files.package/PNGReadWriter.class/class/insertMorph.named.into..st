as yet unclassified
insertMorph: aMorph named: aString into: aBook

	| newPage |

	aBook ifNil: [^self].
	newPage := aBook insertPageLabel: aString morphs: {aMorph}.
	newPage color: Color lightYellow.
	newPage extent: (
		newPage submorphs inject: 10@10 into: [ :ex :m |
			m left: 10.
			ex max: m width @ m bottom
		]
	) + (20@20).
