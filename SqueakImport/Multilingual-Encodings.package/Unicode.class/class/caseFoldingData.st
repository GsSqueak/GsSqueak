casing
caseFoldingData
	
	UIManager default informUserDuring: [ :bar |
		| stream |
		bar value: 'Downloading CaseFolding Unicode data'.
		stream := HTTPClient httpGet: 'http://www.unicode.org/Public/UNIDATA/CaseFolding.txt'.
		(stream isKindOf: RWBinaryOrTextStream) ifFalse: [
			^self error: 'Download failed' ].
		^stream reset; contents ]