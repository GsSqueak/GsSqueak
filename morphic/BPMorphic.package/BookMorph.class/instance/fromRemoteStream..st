initialization
fromRemoteStream: strm
  "Make a book from an index and a bunch of pages on a server. NOT
	showing any page! Index and pages must live in the same directory.
	If the book has moved, save the current correct urls for each of the
	pages. Self must already have a url stored in property #url."

  | _gsSqueakTemp_remote _gsSqueakTemp_dict _gsSqueakTemp_bookUrl _gsSqueakTemp_oldStem _gsSqueakTemp_stem _gsSqueakTemp_oldUrl _gsSqueakTemp_endPart |
  _gsSqueakTemp_remote := strm fileInObjectAndCode.
  _gsSqueakTemp_bookUrl := SqueakPage new
    url: (self valueOfProperty: #'url');
    url.	"expand a relative url"
  _gsSqueakTemp_oldStem := SqueakPage stemUrl: _gsSqueakTemp_remote second url.
  _gsSqueakTemp_oldStem := _gsSqueakTemp_oldStem copyUpToLast: $/.
  _gsSqueakTemp_stem := SqueakPage stemUrl: _gsSqueakTemp_bookUrl.
  _gsSqueakTemp_stem := _gsSqueakTemp_stem copyUpToLast: $/.
  _gsSqueakTemp_oldStem = _gsSqueakTemp_stem
    ifFalse: [ 
      "Book is in new directory, fix page urls"
      2 to: _gsSqueakTemp_remote size do: [ :ii | 
        _gsSqueakTemp_oldUrl := (_gsSqueakTemp_remote at: ii) url.
        _gsSqueakTemp_endPart := _gsSqueakTemp_oldUrl
          copyFrom: _gsSqueakTemp_oldStem size + 1
          to: _gsSqueakTemp_oldUrl size.
        (_gsSqueakTemp_remote at: ii)
          url: _gsSqueakTemp_stem , _gsSqueakTemp_endPart ] ].
  self initialize.
  self pages: OrderedCollection new.
  2 to: _gsSqueakTemp_remote size do: [ :ii | self pages add: (_gsSqueakTemp_remote at: ii) ].
  currentPage
    fullReleaseCachedState;
    delete.	"the blank one"
  currentPage := _gsSqueakTemp_remote second.
  _gsSqueakTemp_dict := _gsSqueakTemp_remote first.
  self setProperty: #'modTime' toValue: (_gsSqueakTemp_dict at: #'modTime').
  _gsSqueakTemp_dict
    at: #'allText'
    ifPresent: [ :val | self setProperty: #'allText' toValue: val ].
  _gsSqueakTemp_dict
    at: #'allTextUrls'
    ifPresent: [ :val | self setProperty: #'allTextUrls' toValue: val ].
  #(#'color' #'borderWidth' #'borderColor' #'pageSize')
    with: #(#'color:' #'borderWidth:' #'borderColor:' #'pageSize:')
    do: [ :key :sel | _gsSqueakTemp_dict at: key ifPresent: [ :val | self perform: sel with: val ] ]