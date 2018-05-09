composing
unicodeData
	
"
	UIManager default informUserDuring: [ :bar |
		| stream |
		bar value: 'Downloading Unicode data'.
		stream := HTTPClient httpGet: 'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt'.
		(stream isKindOf: RWBinaryOrTextStream) ifFalse: [
			^self error: 'Download failed' ].
		^stream reset; contents ]"
