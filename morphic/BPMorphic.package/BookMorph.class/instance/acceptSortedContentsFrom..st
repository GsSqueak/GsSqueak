sorting
acceptSortedContentsFrom: aHolder
  "Update my page list from the given page sorter."

  | _gsSqueakTemp_goodPages _gsSqueakTemp_rejects |
  _gsSqueakTemp_goodPages := OrderedCollection new.
  _gsSqueakTemp_rejects := OrderedCollection new.
  aHolder submorphs
    doWithIndex: [ :m :i | 
      | toAdd sqPage |
      toAdd := nil.
      (m isKindOf: PasteUpMorph)
        ifTrue: [ toAdd := m ].
      (m isKindOf: BookPageThumbnailMorph)
        ifTrue: [ 
          toAdd := m page.
          m bookMorph == self
            ifFalse: [ 
              "borrowed from another book. preserve the
							original "
              toAdd := toAdd veryDeepCopy.	"since we came from elsewhere, cached strings
							are wrong"
              self removeProperty: #'allTextUrls'.
              self removeProperty: #'allText' ] ].
      toAdd isString
        ifTrue: [ 
          "a url"
          toAdd := self pages
            detect: [ :aPage | aPage url = toAdd ]
            ifNone: [ toAdd ] ].
      toAdd isString
        ifTrue: [ 
          sqPage := SqueakPageCache atURL: toAdd.
          toAdd := sqPage contentsMorph
            ifNil: [ sqPage copyForSaving	"a MorphObjectOut" ]
            ifNotNil: [ sqPage contentsMorph ] ].
      toAdd
        ifNil: [ _gsSqueakTemp_rejects add: m ]
        ifNotNil: [ _gsSqueakTemp_goodPages add: toAdd ] ].
  self newPages: _gsSqueakTemp_goodPages.
  _gsSqueakTemp_goodPages isEmpty
    ifTrue: [ self insertPage ].
  _gsSqueakTemp_rejects notEmpty
    ifTrue: [ 
      self
        inform:
          _gsSqueakTemp_rejects size printString , ' objects vanished in this process.' ]