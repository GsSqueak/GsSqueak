menu
savePagesOnURL
	"Write out all pages in this book onto a server.  For any page that does not have a SqueakPage and a url already, ask the user for one.  Give the option of naming all page files by page number.  Any pages that are not in memory will stay that way.  The local disk could be the server."

	| response list firstTime newPlace rand dir bookUrl |
	(self valueOfProperty: #keepTogether) ifNotNil: [
		self inform: 'This book is marked ''keep in one file''. 
Several pages use a common Player.
Save the owner of the book instead.' translated.
		^ self].
	self getAllText.	"stored with index later"
	response := UIManager default chooseFrom:  {
		'Use page numbers' translated.
		'Type in file names' translated.
		'Save in a new place (using page numbers)' translated.
		'Save in a new place (typing names)' translated.
		'Save new book sharing old pages' translated.
	} title:  'Each page will be a file on the server.  
Do you want to page numbers be the names of the files? 
or name each one yourself?' translated.
	response = 1 ifTrue: [self saveAsNumberedURLs. ^ self].
	response = 3 ifTrue: [self forgetURLs; saveAsNumberedURLs. ^ self].
	response = 4 ifTrue: [self forgetURLs].
	response = 5 ifTrue: [
		"Make up new url for .bo file and confirm with user."  "Mark as shared"
		[rand := String new: 4.
		1 to: rand size do: [:ii |
			rand at: ii put: ('bdfghklmnpqrstvwz' at: 17 atRandom)].
		(newPlace := self getStemUrl) isEmpty ifTrue: [^ self].
		newPlace := (newPlace copyUpToLast: $/), '/BK', rand, '.bo'.
		dir := ServerFile new fullPath: newPlace.
		(dir includesKey: dir fileName)] whileTrue.	"keep doing until a new file"

		self setProperty: #url toValue: newPlace.
		self saveAsNumberedURLs. 
		bookUrl := self valueOfProperty: #url.
		(SqueakPage stemUrl: bookUrl) = 
			(SqueakPage stemUrl: currentPage url) ifTrue: [
				bookUrl := true].		"not a shared book"
		(URLMorph grabURL: currentPage url) book: bookUrl.
		^ self].
	response = 0 ifTrue: [^ self].

"self reserveUrlsIfNeeded.	Need two passes here -- name on one, write on second"
pages do: [:aPage |	"does write the current page too"
	aPage isInMemory ifTrue: ["not out now"
		aPage presenter ifNotNil: [aPage presenter flushPlayerListCache].
		aPage saveOnURLbasic.
		]].	"ask user if no url"

list := pages collect: [:aPage |	 aPage sqkPage prePurge].
	"knows not to purge the current page"
list := (list select: [:each | each notNil]) asArray.
"do bulk become:"
(list collect: [:each | each contentsMorph])
	elementsExchangeIdentityWith:
		(list collect: [:spg | MorphObjectOut new xxxSetUrl: spg url page: spg]).

firstTime := (self valueOfProperty: #url) isNil.
self saveIndexOnURL.
self presenter ifNotNil: [self presenter flushPlayerListCache].
firstTime ifTrue: ["Put a thumbnail into the hand"
	URLMorph grabForBook: self.
	self setProperty: #futureUrl toValue: nil].	"clean up"
