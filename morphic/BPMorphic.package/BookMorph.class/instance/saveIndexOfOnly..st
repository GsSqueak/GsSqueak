menu
saveIndexOfOnly: aPage 
	"Modify the index of this book on a server. Read the index, modify the
	entry for just this page, and write back. See saveIndexOnURL. (page
	file names must be unique even if they live in different directories.)"
	| _gsSqueakTemp_mine _gsSqueakTemp_sf _gsSqueakTemp_remote _gsSqueakTemp_pageURL _gsSqueakTemp_num _gsSqueakTemp_pre _gsSqueakTemp_index _gsSqueakTemp_after _gsSqueakTemp_dict _gsSqueakTemp_allText _gsSqueakTemp_allTextUrls _gsSqueakTemp_fName _gsSqueakTemp_strm |
	_gsSqueakTemp_mine := self valueOfProperty: #url.
	_gsSqueakTemp_mine
		ifNil: [^ self saveIndexOnURL].
	_gsSqueakTemp_strm := Cursor wait
				showWhile: [ServerFile new fullPath: _gsSqueakTemp_mine].
	_gsSqueakTemp_strm
		ifNil: [^ self saveIndexOnURL].
	_gsSqueakTemp_strm isString
		ifTrue: [^ self saveIndexOnURL].
	_gsSqueakTemp_strm exists
		ifFalse: [^ self saveIndexOnURL].
	"write whole thing if missing"
	_gsSqueakTemp_strm := _gsSqueakTemp_strm asStream.
	_gsSqueakTemp_strm isString
		ifTrue: [^ self saveIndexOnURL].
	_gsSqueakTemp_remote := _gsSqueakTemp_strm fileInObjectAndCode.
	_gsSqueakTemp_dict := _gsSqueakTemp_remote first.
	_gsSqueakTemp_allText := _gsSqueakTemp_dict
				at: #allText
				ifAbsent: [].
	"remote, not local"
	_gsSqueakTemp_allTextUrls := _gsSqueakTemp_dict
				at: #allTextUrls
				ifAbsent: [].
	_gsSqueakTemp_allText size + 1 ~= _gsSqueakTemp_remote size
		ifTrue: [self error: '.bo size mismatch.  Please tell Ted what you just did to this book.' translated].
	(_gsSqueakTemp_pageURL := aPage url)
		ifNil: [self error: 'just had one!' translated].
	_gsSqueakTemp_fName := _gsSqueakTemp_pageURL copyAfterLast: $/.
	2
		to: _gsSqueakTemp_remote size
		do: [:ii | 
			((_gsSqueakTemp_remote at: ii) url
					findString: _gsSqueakTemp_fName
					startingAt: 1
					caseSensitive: false)
					> 0
				ifTrue: [_gsSqueakTemp_index := ii].
			"fast"
			(_gsSqueakTemp_remote at: ii) xxxReset].
	_gsSqueakTemp_index
		ifNil: ["new page, what existing page does it follow?"
			_gsSqueakTemp_num := self pageNumberOf: aPage.
			1
				to: _gsSqueakTemp_num - 1
				do: [:ii | (pages at: ii) url
						ifNotNil: [_gsSqueakTemp_pre := (pages at: ii) url]].
			_gsSqueakTemp_pre
				ifNil: [_gsSqueakTemp_after := _gsSqueakTemp_remote size + 1]
				ifNotNil: ["look for it on disk, put me after"
					_gsSqueakTemp_pre := _gsSqueakTemp_pre copyAfterLast: $/.
					2
						to: _gsSqueakTemp_remote size
						do: [:ii | ((_gsSqueakTemp_remote at: ii) url
									findString: _gsSqueakTemp_pre
									startingAt: 1
									caseSensitive: false)
									> 0
								ifTrue: [_gsSqueakTemp_after := ii + 1]].
					_gsSqueakTemp_after
						ifNil: [_gsSqueakTemp_after := _gsSqueakTemp_remote size + 1]].
			_gsSqueakTemp_remote := _gsSqueakTemp_remote
						copyReplaceFrom: _gsSqueakTemp_after
						to: _gsSqueakTemp_after - 1
						with: #(1).
			_gsSqueakTemp_allText
				ifNotNil: [_gsSqueakTemp_dict
						at: #allText
						put: (_gsSqueakTemp_allText
								copyReplaceFrom: _gsSqueakTemp_after - 1
								to: _gsSqueakTemp_after - 2
								with: #(#())).
					_gsSqueakTemp_dict
						at: #allTextUrls
						put: (_gsSqueakTemp_allTextUrls
								copyReplaceFrom: _gsSqueakTemp_after - 1
								to: _gsSqueakTemp_after - 2
								with: #(#()))].
			_gsSqueakTemp_index := _gsSqueakTemp_after].
	_gsSqueakTemp_remote at: _gsSqueakTemp_index put: aPage sqkPage copyForSaving.
	(_gsSqueakTemp_dict
			at: #modTime
			ifAbsent: [0])
			< Time totalSeconds
		ifTrue: [_gsSqueakTemp_dict at: #modTime put: Time totalSeconds].
	_gsSqueakTemp_allText
		ifNotNil: [(_gsSqueakTemp_dict at: #allText)
				at: _gsSqueakTemp_index - 1
				put: (aPage allStringsAfter: nil).
			(_gsSqueakTemp_dict at: #allTextUrls)
				at: _gsSqueakTemp_index - 1
				put: _gsSqueakTemp_pageURL].
	_gsSqueakTemp_sf := ServerDirectory new fullPath: _gsSqueakTemp_mine.
	Cursor wait
		showWhile: [| remoteFile |
			remoteFile := _gsSqueakTemp_sf fileNamed: _gsSqueakTemp_mine.
			remoteFile fileOutClass: nil andObject: _gsSqueakTemp_remote]