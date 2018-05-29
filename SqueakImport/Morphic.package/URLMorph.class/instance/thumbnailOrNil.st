private
thumbnailOrNil
	"Answer the thumbnail Form for the page this morph represents. Answer nil if no thumbnail is available."

	| thum |
	page ifNil: [page := SqueakPageCache atURL: url].
	(thum := page thumbnail) ifNil: [^nil].
	^(thum isForm) 
		ifTrue: [thum]
		ifFalse: [thum form	"a BookPageThumbnailMorph"]