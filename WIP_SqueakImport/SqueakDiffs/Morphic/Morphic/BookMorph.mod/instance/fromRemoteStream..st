initialization
fromRemoteStream: strm 
	"Make a book from an index and a bunch of pages on a server.  NOT showing any page!  Index and pages must live in the same directory.  If the book has moved, save the current correct urls for each of the pages.  Self must already have a url stored in property #url."

	| remote dict bookUrl oldStem stem oldUrl endPart |
	remote := strm fileInObjectAndCode.
	bookUrl := (SqueakPage new)
				url: (self valueOfProperty: #url);
				url.
	"expand a relative url"
	oldStem := SqueakPage stemUrl: (remote second) url.
	oldStem := oldStem copyUpToLast: $/.
	stem := SqueakPage stemUrl: bookUrl.
	stem := stem copyUpToLast: $/.
	oldStem = stem 
		ifFalse: 
			["Book is in new directory, fix page urls"

			2 to: remote size
				do: 
					[:ii | 
					oldUrl := (remote at: ii) url.
					endPart := oldUrl copyFrom: oldStem size + 1 to: oldUrl size.
					(remote at: ii) url: stem , endPart]].
	self initialize.
	pages := OrderedCollection new.
	2 to: remote size do: [:ii | pages add: (remote at: ii)].
	currentPage
		fullReleaseCachedState;
		delete.	"the blank one"
	currentPage := remote second.
	dict := remote first.
	self setProperty: #modTime toValue: (dict at: #modTime).
	dict at: #allText
		ifPresent: [:val | self setProperty: #allText toValue: val].
	dict at: #allTextUrls
		ifPresent: [:val | self setProperty: #allTextUrls toValue: val].
	#(#color #borderWidth #borderColor #pageSize) 
		with: #(#color: #borderWidth: #borderColor: #pageSize:)
		do: [:key :sel | dict at: key ifPresent: [:val | self perform: sel with: val]].
	^self