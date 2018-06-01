sorting
morphsForPageSorter
	| thumbnails |
	'Assembling thumbnail images...'
		displayProgressFrom: 0 to: pages size
		during:
			[:bar | | i |
			i := 0.
			thumbnails := pages collect:
				[:p | bar value: (i:= i+1).
				pages size > 40 
					ifTrue: [p smallThumbnailForPageSorter inBook: self]
					ifFalse: [p thumbnailForPageSorter inBook: self]]].
	^ thumbnails