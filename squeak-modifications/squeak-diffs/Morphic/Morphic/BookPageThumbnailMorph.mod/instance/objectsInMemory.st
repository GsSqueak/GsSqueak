fileIn/Out
objectsInMemory
	"See if page or bookMorph need to be brought in from a server."
	| bookUrl bk wld try |
	bookMorph ifNil: ["fetch the page"
		page isString ifFalse: [^ self].	"a morph"
		try := (SqueakPageCache atURL: page) fetchContents.
		try ifNotNil: [page := try].
		^ self].
	bookMorph isString ifTrue: [
		bookUrl := bookMorph.
		(wld := self world) ifNil: [wld := Smalltalk currentWorld].
		bk := BookMorph isInWorld: wld withUrl: bookUrl.
		bk == #conflict ifTrue: [
			^ self inform: 'This book is already open in some other project' translated].
		bk == #out ifTrue: [
			(bk := BookMorph new fromURL: bookUrl) ifNil: [^ self]].
		bookMorph := bk].
	page isString ifTrue: [
		page := (bookMorph pages detect: [:pg | pg url = page] 
					ifNone: [bookMorph pages first])].
