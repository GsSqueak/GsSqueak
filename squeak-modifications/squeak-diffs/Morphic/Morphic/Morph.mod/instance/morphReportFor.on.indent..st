printing
morphReportFor: attributeList on: aStream indent: anInteger

	anInteger timesRepeat: [aStream tab].
	aStream print: self; space.
	attributeList do: [ :a | aStream print: (self perform: a); space].
	aStream cr.
	submorphs do: [ :sub |
		sub morphReportFor: attributeList on: aStream indent: anInteger + 1
	].