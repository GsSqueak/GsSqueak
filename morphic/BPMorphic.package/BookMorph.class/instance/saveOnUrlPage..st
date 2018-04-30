menu
saveOnUrlPage: pageMorph 
	"Write out this single page in this book onto a server. See
	savePagesOnURL. (Don't compute the texts, only this page's is
	written.) "
	| _gsSqueakTemp_stem _gsSqueakTemp_ind _gsSqueakTemp_response _gsSqueakTemp_rand _gsSqueakTemp_newPlace _gsSqueakTemp_dir |
	(self valueOfProperty: #keepTogether)
		ifNotNil: [self inform: 'This book is marked ''keep in one file''. 
Several pages use a common Player.
Save the owner of the book instead.' translated.
			^ self].
	"Don't give the chance to put in a different place. Assume named by
	number "
	((self valueOfProperty: #url) isNil
			and: [pages first url notNil])
		ifTrue: [_gsSqueakTemp_response := UIManager default chooseFrom: {'Old book' translated. 'New book sharing old pages' translated} title: 'Modify the old book, or make a new
book sharing its pages?' translated.
			_gsSqueakTemp_response = 2
				ifTrue: ["Make up new url for .bo file and confirm with user."
					"Mark as shared"
					[_gsSqueakTemp_rand := String new: 4.
					1
						to: _gsSqueakTemp_rand size
						do: [:ii | _gsSqueakTemp_rand
								at: ii
								put: ('bdfghklmnpqrstvwz' at: 17 atRandom)].
					(_gsSqueakTemp_newPlace := self getStemUrl) isEmpty
						ifTrue: [^ self].
					_gsSqueakTemp_newPlace := (_gsSqueakTemp_newPlace copyUpToLast: $/)
								, '/BK' , _gsSqueakTemp_rand , '.bo'.
					_gsSqueakTemp_dir := ServerFile new fullPath: _gsSqueakTemp_newPlace.
					_gsSqueakTemp_dir includesKey: _gsSqueakTemp_dir fileName] whileTrue.
					"keep doing until a new file"
					self setProperty: #url toValue: _gsSqueakTemp_newPlace].
			_gsSqueakTemp_response = 0
				ifTrue: [^ self]].
	_gsSqueakTemp_stem := self getStemUrl.
	"user must approve"
	_gsSqueakTemp_stem isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_ind := pages
				identityIndexOf: pageMorph
				ifAbsent: [self error: 'where is the page?' translated].
	pageMorph isInMemory
		ifTrue: ["not out now"
			pageMorph saveOnURL: _gsSqueakTemp_stem , _gsSqueakTemp_ind printString , '.sp'].
	self saveIndexOfOnly: pageMorph