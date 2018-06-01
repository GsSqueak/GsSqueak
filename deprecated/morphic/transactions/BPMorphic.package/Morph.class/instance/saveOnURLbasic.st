fileIn/out
saveOnURLbasic
	"Ask the user for a url and save myself on a SmartReferenceStream
	file. Writes out the version and class structure. The file is fileIn-able.
	UniClasses will be filed out."
	| url pg stamp pol |
	(pg := self valueOfProperty: #SqueakPage)
		ifNil: [pg := SqueakPage new]
		ifNotNil: [pg contentsMorph ~~ self
				ifTrue: [self inform: 'morph''s SqueakPage property is out of date'.
					pg := SqueakPage new]].
	(url := pg url)
		ifNil: [url := ServerDirectory defaultStemUrl , '1.sp'.
			"A new legal place"
			url := UIManager default request: 'url of a place to store this object.
Must begin with file:// or ftp://' initialAnswer: url.
			url isEmpty
				ifTrue: [^ #cancel]].
	stamp := Utilities authorInitialsPerSe.
	stamp isEmptyOrNil
		ifTrue: [stamp := '*'].
	pg saveMorph: self author: stamp.
	SqueakPageCache atURL: url put: pg.
	"setProperty: #SqueakPage"
	(pol := pg policy)
		ifNil: [pol := #neverWrite].
	pg policy: #now;
		 dirty: true.
	pg write.
	"force the write"
	pg policy: pol.
	^ pg