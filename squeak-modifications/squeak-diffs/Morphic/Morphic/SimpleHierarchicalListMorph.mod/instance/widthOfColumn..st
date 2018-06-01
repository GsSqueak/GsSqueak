private - caching
widthOfColumn: index 

	self columns ifNil: [^ nil].
	
	"Try columns cache."
	(self columnsCache at: index)
		ifNotNil: [:cachedWidth | ^ cachedWidth].
		
	^ (self columns at: index)
		ifNil: [nil]
		ifNotNil: [:widthOrSpec |
			"Fill columns cache."
			self columnsCache
				at: index
				put: (widthOrSpec isNumber
					ifTrue: [widthOrSpec]
					ifFalse: [widthOrSpec isBlock
						ifTrue: [widthOrSpec cull: self]
						ifFalse: [50 "fall back for bad spec"]])]