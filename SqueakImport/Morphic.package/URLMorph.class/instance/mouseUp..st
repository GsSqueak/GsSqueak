event handling
mouseUp: evt
	| pg ow newPage mm bookUrl bk |
	"If url of a book, open it to that page, or bring it in and open to that page."
	book ifNotNil: [book == false ifFalse: [
		(bookUrl := book) isString ifFalse: [
			bookUrl := (SqueakPage stemUrl: url), '.bo'].
		(bk := BookMorph isInWorld: self world withUrl: bookUrl) class ~~ Symbol 
			ifTrue: [^ bk goToPageUrl: url].
		bk == #conflict ifTrue: [
			^ self inform: 'This book is already open in some other project'].
		(bk := BookMorph new fromURL: bookUrl) ifNil: [^ self].
		bk goToPageUrl: url.	"turn to the page"
		^ HandMorph attach: bk]].

	"If inside a SqueakPage, replace it!"
	pg := self enclosingPage.
	pg ifNotNil: [
		(ow := pg contentsMorph owner) ifNotNil: [
			pg contentsMorph delete.	"from its owner"
			newPage := SqueakPageCache atURL: url.
			mm := newPage fetchContents.
			mm ifNotNil: [ow addMorph: mm.
				page := newPage].
			^ self]].
	"If I am a project, jump  -- not done yet"

	"For now, just put new page on the hand"
	newPage := SqueakPageCache atURL: url.
	mm := newPage fetchInformIfError.
	mm ifNotNil: [self primaryHand attachMorph: mm.
		page := newPage].

