insert and delete
deletePageBasic
  | _gsSqueakTemp_thisPage |
  _gsSqueakTemp_thisPage := self pageNumberOf: currentPage.
  self pages remove: currentPage.
  currentPage delete.
  currentPage := nil.
  self pages isEmpty
    ifTrue: [ ^ self insertPage ].
  self goToPage: (_gsSqueakTemp_thisPage min: self pages size)