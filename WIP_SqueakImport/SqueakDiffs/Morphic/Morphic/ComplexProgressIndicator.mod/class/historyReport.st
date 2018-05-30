as yet unclassified
historyReport
"
ComplexProgressIndicator historyReport
"
	| answer |
	History ifNil: [^Beeper beep].
	answer := String streamContents: [ :strm |
		(History keys asArray sort: [ :a :b | a asString <= b asString]) do: [ :k |
			| data |
			strm nextPutAll: k printString; cr.
			data := History at: k.
			(data keys asArray sort: [ :a :b | a asString <= b asString]) do: [ :dataKey |
				strm tab; nextPutAll: dataKey printString,'  ',
					(data at: dataKey) asArray printString; cr.
			].
			strm cr.
		].
	].
	StringHolder new
		contents: answer contents;
		openLabel: 'Progress History'