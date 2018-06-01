private - caching
widthOfColumn: index 
	self columns
		ifNil: [^ nil].
	"Try columns cache."
	(self columnsCache at: index)
		ifNotNil: [:cachedWidth | ^ cachedWidth].
	^ (self columns at: index)
		ifNotNil: [:widthOrSpec | "Fill columns cache."
			self columnsCache
				at: index
				put: (widthOrSpec isNumber
						ifTrue: [widthOrSpec]
						ifFalse: [widthOrSpec isBlock
								ifTrue: [widthOrSpec cull: self]
								ifFalse: ["fall back for bad spec"
									50]])]