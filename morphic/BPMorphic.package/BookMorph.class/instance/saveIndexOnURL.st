menu
saveIndexOnURL
  "Make up an index to the pages of this book, with thumbnails, and
	store it on the server. (aDictionary, aMorphObjectOut,
	aMorphObjectOut, aMorphObjectOut). The last part corresponds
	exactly to what pages looks like when they are all out. Each holds
	onto a SqueakPage, which holds a url and a thumbnail."

  | _gsSqueakTemp_dict _gsSqueakTemp_mine _gsSqueakTemp_sf _gsSqueakTemp_urlList _gsSqueakTemp_list |
  self pages isEmpty
    ifTrue: [ ^ self ].
  _gsSqueakTemp_dict := Dictionary new.
  _gsSqueakTemp_dict at: #'modTime' put: Time totalSeconds.	"self getAllText MUST have been called at start of this operation."
  _gsSqueakTemp_dict at: #'allText' put: (self valueOfProperty: #'allText').
  #(#'color' #'borderWidth' #'borderColor' #'pageSize')
    do: [ :sel | _gsSqueakTemp_dict at: sel put: (self perform: sel) ].
  self reserveUrlsIfNeeded.	"should already be done"
  _gsSqueakTemp_list := self pages copy.	"paste dict on front below"	"Fix up the entries, should already be done"
  _gsSqueakTemp_list
    doWithIndex: [ :out :ind | 
      out isInMemory
        ifTrue: [ 
          (out valueOfProperty: #'SqueakPage') ifNil: [ out saveOnURLbasic ].
          _gsSqueakTemp_list at: ind put: out sqkPage copyForSaving ] ].
  _gsSqueakTemp_urlList := _gsSqueakTemp_list collect: [ :ppg | ppg url ].
  self setProperty: #'allTextUrls' toValue: _gsSqueakTemp_urlList.
  _gsSqueakTemp_dict at: #'allTextUrls' put: _gsSqueakTemp_urlList.
  _gsSqueakTemp_list := (Array with: _gsSqueakTemp_dict) , _gsSqueakTemp_list.
  _gsSqueakTemp_mine := self valueOfProperty: #'url'.
  _gsSqueakTemp_mine
    ifNil: [ 
      _gsSqueakTemp_mine := self getStemUrl , '.bo'.
      self setProperty: #'url' toValue: _gsSqueakTemp_mine ].
  _gsSqueakTemp_sf := ServerDirectory new fullPath: _gsSqueakTemp_mine.
  Cursor wait
    showWhile: [ 
      | remoteFile |
      remoteFile := _gsSqueakTemp_sf fileNamed: _gsSqueakTemp_mine.
      remoteFile dataIsValid.
      remoteFile fileOutClass: nil andObject: _gsSqueakTemp_list	"remoteFile close" ]