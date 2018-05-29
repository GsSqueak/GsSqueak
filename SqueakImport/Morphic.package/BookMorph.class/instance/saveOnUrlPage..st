menu
saveOnUrlPage: pageMorph
	"Write out this single page in this book onto a server.  See savePagesOnURL.  (Don't compute the texts, only this page's is written.)"
	| stem ind response rand newPlace dir |
	(self valueOfProperty: #keepTogether) ifNotNil: [
		self inform: 'This book is marked ''keep in one file''. 
Several pages use a common Player.
Save the owner of the book instead.' translated.
		^ self].
	"Don't give the chance to put in a different place.  Assume named by number"
	((self valueOfProperty: #url) isNil and: [pages first url notNil]) ifTrue: [
		response := UIManager default chooseFrom: {
			'Old book' translated.
			'New book sharing old pages' translated
		} title: 'Modify the old book, or make a new
book sharing its pages?' translated.
		response = 2 ifTrue: [
			"Make up new url for .bo file and confirm with user."  "Mark as shared"
			[rand := String new: 4.
			1 to: rand size do: [:ii |
				rand at: ii put: ('bdfghklmnpqrstvwz' at: 17 atRandom)].
			(newPlace := self getStemUrl) isEmpty ifTrue: [^ self].
			newPlace := (newPlace copyUpToLast: $/), '/BK', rand, '.bo'.
			dir := ServerFile new fullPath: newPlace.
			(dir includesKey: dir fileName)] whileTrue.	"keep doing until a new file"
			self setProperty: #url toValue: newPlace].
		response = 0 ifTrue: [^ self]].

	stem := self getStemUrl.	"user must approve"
	stem isEmpty ifTrue: [^ self].
	ind := pages identityIndexOf: pageMorph ifAbsent: [self error: 'where is the page?' translated].
	pageMorph isInMemory ifTrue: ["not out now"
			pageMorph saveOnURL: stem,(ind printString),'.sp'].
	self saveIndexOfOnly: pageMorph.