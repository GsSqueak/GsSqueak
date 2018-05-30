menu
saveIndexOfOnly: aPage
	"Modify the index of this book on a server.  Read the index, modify the entry for just this page, and write back.  See saveIndexOnURL. (page file names must be unique even if they live in different directories.)"

	| mine sf remote pageURL num pre index after dict allText allTextUrls fName strm |
	mine := self valueOfProperty: #url.
	mine ifNil: [^ self saveIndexOnURL].
	strm := Cursor wait showWhile: [ServerFile new fullPath: mine].
	strm ifNil: [^ self saveIndexOnURL].
	strm isString ifTrue: [^ self saveIndexOnURL].
	strm exists ifFalse: [^ self saveIndexOnURL].	"write whole thing if missing"
	strm := strm asStream.
	strm isString ifTrue: [^ self saveIndexOnURL].
	remote := strm fileInObjectAndCode.
	dict := remote first.
	allText := dict at: #allText ifAbsent: [nil].	"remote, not local"
	allTextUrls := dict at: #allTextUrls ifAbsent: [nil].
	allText size + 1 ~= remote size ifTrue: [self error: '.bo size mismatch.  Please tell Ted what you just did to this book.' translated].


	(pageURL := aPage url) ifNil: [self error: 'just had one!' translated].
	fName := pageURL copyAfterLast: $/.
	2 to: remote size do: [:ii | 
		((remote at: ii) url findString: fName startingAt: 1 
						caseSensitive: false) > 0 ifTrue: [index := ii].	"fast"
		(remote at: ii) xxxReset].
	index ifNil: ["new page, what existing page does it follow?"
		num := self pageNumberOf: aPage.
		1 to: num-1 do: [:ii | (pages at: ii) url ifNotNil: [pre := (pages at: ii) url]].
		pre ifNil: [after := remote size+1]
			ifNotNil: ["look for it on disk, put me after"
				pre := pre copyAfterLast: $/.
				2 to: remote size do: [:ii | 
					((remote at: ii) url findString: pre startingAt: 1 
								caseSensitive: false) > 0 ifTrue: [after := ii+1]].
				after ifNil: [after := remote size+1]].
		remote := remote copyReplaceFrom: after to: after-1 with: #(1).
		allText ifNotNil: [
			dict at: #allText put: (allText copyReplaceFrom: after-1 to: after-2 with: #(())).
			dict at: #allTextUrls put: (allTextUrls copyReplaceFrom: after-1 to: after-2 with: #(()))].
		index := after].

	remote at: index put: (aPage sqkPage copyForSaving).

	(dict at: #modTime ifAbsent: [0]) < Time totalSeconds ifTrue:
		[dict at: #modTime put: Time totalSeconds].
	allText ifNotNil: [
		(dict at: #allText) at: index-1 put: (aPage allStringsAfter: nil).
		(dict at: #allTextUrls) at: index-1 put: pageURL].

	sf := ServerDirectory new fullPath: mine.
	Cursor wait showWhile: [ | remoteFile |
		remoteFile := sf fileNamed: mine.
		remoteFile fileOutClass: nil andObject: remote.
		"remoteFile close"].
