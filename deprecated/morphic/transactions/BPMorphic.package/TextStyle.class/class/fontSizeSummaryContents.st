utilities
fontSizeSummaryContents
	^ String
		streamContents: [:aStream | self knownTextStyles
				do: [:aStyleName | 
					aStream nextPutAll: aStyleName , '  ' , (self fontPointSizesFor: aStyleName) asArray storeString.
					aStream cr]]