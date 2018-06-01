accessing
fetchInformIfError
	"Make every effort to get contentsMorph.  Put up a good notice if can't get it.  Assume page is in the cache already.  Overwrite the contentsMorph no matter what."
	| strm page temp temp2 |

	SqueakPageCache write.		"sorry about the pause"
	strm := Cursor wait showWhile: [
		(ServerFile new fullPath: url) asStream].
	strm isString ifTrue: [self inform: 'Sorry, ',strm. ^ nil].	"<<<<< Note Diff"
	(url beginsWith: 'file:') ifTrue: [Transcript show: 'Fetching  ', url; cr].	
	page := strm fileInObjectAndCode.
	page isMorph 
		ifTrue: [contentsMorph := page]	"may be a bare morph"
		ifFalse: ["copy over the state"
			temp := url.
			temp2 := policy.
			self copyFrom: page.	"including contentsMorph"
			url := temp.	"I know best!"
			temp2 ifNotNil: [policy := temp2]].		"use mine"
	contentsMorph setProperty: #pageDirty toValue: nil.
	contentsMorph setProperty: #SqueakPage toValue: self.
	self dirty: false.
	^ contentsMorph