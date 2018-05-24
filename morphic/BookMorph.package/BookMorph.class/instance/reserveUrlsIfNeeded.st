menu
reserveUrlsIfNeeded
  "See if this book needs to pre-allocate urls. Harmless if have urls
	already. Actually writes dummy files to reserve names."

  | _gsSqueakTemp_baddies _gsSqueakTemp_bad2 |
  self pages size > 25
    ifTrue: [ ^ self reserveUrls ].
  _gsSqueakTemp_baddies := BookPageThumbnailMorph withAllSubclasses.
  _gsSqueakTemp_bad2 := FlexMorph withAllSubclasses.
  self pages
    do: [ :aPage | 
      aPage
        allMorphsDo: [ :mm | 
          (_gsSqueakTemp_baddies includes: mm class)
            ifTrue: [ ^ self reserveUrls ].
          (_gsSqueakTemp_bad2 includes: mm class)
            ifTrue: [ 
              mm originalMorph class == aPage class
                ifTrue: [ ^ self reserveUrls ] ] ] ]