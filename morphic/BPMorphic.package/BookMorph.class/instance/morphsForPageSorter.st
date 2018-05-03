sorting
morphsForPageSorter
  | _gsSqueakTemp_thumbnails |
  'Assembling thumbnail images...'
    displayProgressFrom: 0
    to: self pages size
    during: [ :bar | 
      | i |
      i := 0.
      _gsSqueakTemp_thumbnails := self pages
        collect: [ :p | 
          bar value: (i := i + 1).
          self pages size > 40
            ifTrue: [ p smallThumbnailForPageSorter inBook: self ]
            ifFalse: [ p thumbnailForPageSorter inBook: self ] ] ].
  ^ _gsSqueakTemp_thumbnails