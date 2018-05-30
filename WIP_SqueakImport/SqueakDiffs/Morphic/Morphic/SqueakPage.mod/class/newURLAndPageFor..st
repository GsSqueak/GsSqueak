as yet unclassified
newURLAndPageFor: aMorph
	"Create a new SqueakPage whose contents is the given morph. Assign a URL for that page, record it in the page cache, and answer its URL."

	| pg newURL stamp |
	pg := self new.
	stamp := Utilities authorInitialsPerSe.
	stamp isEmptyOrNil ifTrue: [ stamp := '*' ].
	pg saveMorph: aMorph author: stamp.
	newURL := SqueakPageCache generateURL.
	SqueakPageCache atURL: newURL put: pg.
	^ newURL