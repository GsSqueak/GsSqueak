accessing
fetchContentsIfAbsent: failBlock
	"Make every effort to get contentsMorph.  Assume I am in the cache already."
	| strm page temp temp2 |
	SqueakPageCache write.		"sorry about the pause"
	strm := Cursor wait showWhile: [
		(ServerFile new fullPath: url) asStream].
	strm isString ifTrue: [^ failBlock value].		
	page := strm fileInObjectAndCode.
	page isMorph ifTrue: [contentsMorph := page].	"may be a bare morph"
	"copy over the state"
	temp := url.
	temp2 := policy.
	self copyAddedStateFrom: page.
	url := temp.	"don't care what it says"
	temp2 ifNotNil: [policy := temp2].		"use mine"
	contentsMorph setProperty: #pageDirty toValue: nil.
	self dirty: false.
	^ contentsMorph