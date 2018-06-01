menu
saveAsNumberedURLs
  "Write out all pages in this book that are not showing, onto a server.
	The local disk could be the server. For any page that does not have a
	SqueakPage and a url already, name that page file by its page
	number. Any pages that are already totally out will stay that way."

  | _gsSqueakTemp_stem _gsSqueakTemp_list _gsSqueakTemp_firstTime |
  _gsSqueakTemp_firstTime := (self valueOfProperty: #'url') isNil.
  _gsSqueakTemp_stem := self getStemUrl.	"user must approve"
  _gsSqueakTemp_stem isEmpty
    ifTrue: [ ^ self ].
  _gsSqueakTemp_firstTime
    ifTrue: [ self setProperty: #'futureUrl' toValue: _gsSqueakTemp_stem , '.bo' ].
  self reserveUrlsIfNeeded.
  self pages
    doWithIndex: [ :aPage :ind | 
      "does write the current page too"
      aPage isInMemory
        ifTrue: [ 
          "not out now"
          aPage presenter ifNotNil: [ aPage presenter flushPlayerListCache ].
          aPage saveOnURL: _gsSqueakTemp_stem , ind printString , '.sp' ] ].
  _gsSqueakTemp_list := self pages collect: [ :aPage | aPage sqkPage prePurge ].	"knows not to purge the current page"
  _gsSqueakTemp_list := (_gsSqueakTemp_list select: [ :each | each notNil ])
    asArray.	"do bulk become:"
  (_gsSqueakTemp_list collect: [ :each | each contentsMorph ])
    elementsExchangeIdentityWith:
      (_gsSqueakTemp_list
        collect: [ :spg | MorphObjectOut new xxxSetUrl: spg url page: spg ]).
  self saveIndexOnURL.
  self presenter ifNotNil: [ self presenter flushPlayerListCache ].
  _gsSqueakTemp_firstTime
    ifTrue: [ 
      "Put a thumbnail into the hand"
      URLMorph grabForBook: self.
      self setProperty: #'futureUrl' toValue: nil	"clean up" ]