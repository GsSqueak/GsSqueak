menu
savePagesOnURL
  "Write out all pages in this book onto a server. For any page that does
	not have a SqueakPage and a url already, ask the user for one. Give
	the option of naming all page files by page number. Any pages that
	are not in memory will stay that way. The local disk could be the
	server. "

  | _gsSqueakTemp_response _gsSqueakTemp_list _gsSqueakTemp_firstTime _gsSqueakTemp_newPlace _gsSqueakTemp_rand _gsSqueakTemp_dir _gsSqueakTemp_bookUrl |
  (self valueOfProperty: #'keepTogether')
    ifNotNil: [ 
      self
        inform:
          'This book is marked ''keep in one file''. 
Several pages use a common Player.
Save the owner of the book instead.'
            translated.
      ^ self ].
  self getAllText.	"stored with index later"
  _gsSqueakTemp_response := UIManager default
    chooseFrom:
      {('Use page numbers' translated).
      ('Type in file names' translated).
      ('Save in a new place (using page numbers)' translated).
      ('Save in a new place (typing names)' translated).
      ('Save new book sharing old pages' translated)}
    title:
      'Each page will be a file on the server.  
Do you want to page numbers be the names of the files? 
or name each one yourself?'
        translated.
  _gsSqueakTemp_response = 1
    ifTrue: [ 
      self saveAsNumberedURLs.
      ^ self ].
  _gsSqueakTemp_response = 3
    ifTrue: [ 
      self
        forgetURLs;
        saveAsNumberedURLs.
      ^ self ].
  _gsSqueakTemp_response = 4
    ifTrue: [ self forgetURLs ].
  _gsSqueakTemp_response = 5
    ifTrue: [ 
      "Make up new url for .bo file and confirm with user."
      "Mark as shared"
      [ 
      _gsSqueakTemp_rand := String new: 4.
      1 to: _gsSqueakTemp_rand size do: [ :ii | _gsSqueakTemp_rand at: ii put: ('bdfghklmnpqrstvwz' at: 17 atRandom) ].
      (_gsSqueakTemp_newPlace := self getStemUrl) isEmpty
        ifTrue: [ ^ self ].
      _gsSqueakTemp_newPlace := (_gsSqueakTemp_newPlace copyUpToLast: $/)
        , '/BK' , _gsSqueakTemp_rand , '.bo'.
      _gsSqueakTemp_dir := ServerFile new fullPath: _gsSqueakTemp_newPlace.
      _gsSqueakTemp_dir includesKey: _gsSqueakTemp_dir fileName ]
        whileTrue.	"keep doing until a new file"
      self setProperty: #'url' toValue: _gsSqueakTemp_newPlace.
      self saveAsNumberedURLs.
      _gsSqueakTemp_bookUrl := self valueOfProperty: #'url'.
      (SqueakPage stemUrl: _gsSqueakTemp_bookUrl)
        = (SqueakPage stemUrl: currentPage url)
        ifTrue: [ _gsSqueakTemp_bookUrl := true ].	"not a shared book"
      (URLMorph grabURL: currentPage url) book: _gsSqueakTemp_bookUrl.
      ^ self ].
  _gsSqueakTemp_response = 0
    ifTrue: [ ^ self ].	"self reserveUrlsIfNeeded.	Need two passes here -- name on one, write
	on second"
  self pages
    do: [ :aPage | 
      "does write the current page too"
      aPage isInMemory
        ifTrue: [ 
          "not out now"
          aPage presenter ifNotNil: [ aPage presenter flushPlayerListCache ].
          aPage saveOnURLbasic ] ].	"ask user if no url"
  _gsSqueakTemp_list := self pages collect: [ :aPage | aPage sqkPage prePurge ].	"knows not to purge the current page"
  _gsSqueakTemp_list := (_gsSqueakTemp_list select: [ :each | each notNil ])
    asArray.	"do bulk become:"
  (_gsSqueakTemp_list collect: [ :each | each contentsMorph ])
    elementsExchangeIdentityWith:
      (_gsSqueakTemp_list
        collect: [ :spg | MorphObjectOut new xxxSetUrl: spg url page: spg ]).
  _gsSqueakTemp_firstTime := (self valueOfProperty: #'url') isNil.
  self saveIndexOnURL.
  self presenter ifNotNil: [ self presenter flushPlayerListCache ].
  _gsSqueakTemp_firstTime
    ifTrue: [ 
      "Put a thumbnail into the hand"
      URLMorph grabForBook: self.
      self setProperty: #'futureUrl' toValue: nil ]