menu
reload
	"Fetch the pages of this book from the server again. For all pages that
	have not been modified, keep current ones. Use new pages. For each,
	look up in cache, if time there is equal to time of new, and its in, use
	the current morph.
	Later do fancy things when a page has changed here, and also on the
	server. "
	| _gsSqueakTemp_url _gsSqueakTemp_onServer _gsSqueakTemp_onPgs _gsSqueakTemp_which |
	(_gsSqueakTemp_url := self valueOfProperty: #url)
		ifNil: ["for .bo index file"
			_gsSqueakTemp_url := UIManager default request: 'url of the place where this book''s index is stored.
Must begin with file:// or ftp://' translated initialAnswer: self getStemUrl , '.bo'.
			_gsSqueakTemp_url notEmpty
				ifTrue: [self setProperty: #url toValue: _gsSqueakTemp_url]
				ifFalse: [^ self]].
	_gsSqueakTemp_onServer := self class new fromURL: _gsSqueakTemp_url.
	"Later: test book times?"
	_gsSqueakTemp_onPgs := _gsSqueakTemp_onServer pages
				collect: [:out | 
					| sq |
					sq := SqueakPageCache pageCache
								at: out url
								ifAbsent: [].
					(sq notNil
							and: [sq contentsMorph isInMemory])
						ifTrue: [(out sqkPage lastChangeTime > sq lastChangeTime
									or: [sq contentsMorph isNil])
								ifTrue: [SqueakPageCache atURL: out url put: out sqkPage.
									out]
								ifFalse: [sq contentsMorph]]
						ifFalse: [SqueakPageCache atURL: out url put: out sqkPage.
							out]].
	_gsSqueakTemp_which := (_gsSqueakTemp_onPgs
				findFirst: [:pg | pg url = currentPage url])
				max: 1.
	self newPages: _gsSqueakTemp_onPgs currentIndex: _gsSqueakTemp_which.
	"later stay at current page"
	self
		setProperty: #modTime
		toValue: (_gsSqueakTemp_onServer valueOfProperty: #modTime).
	self
		setProperty: #allText
		toValue: (_gsSqueakTemp_onServer valueOfProperty: #allText).
	self
		setProperty: #allTextUrls
		toValue: (_gsSqueakTemp_onServer valueOfProperty: #allTextUrls)