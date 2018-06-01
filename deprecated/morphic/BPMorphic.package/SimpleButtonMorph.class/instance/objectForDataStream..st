objects from disk
objectForDataStream: refStrm 
	"I am about to be written on an object file. If I send a message to a
	BookMorph, it would be bad to write that object out. Create and write
	out a URLMorph instead."
	| _gsSqueakTemp_bb _gsSqueakTemp_thatPage _gsSqueakTemp_um _gsSqueakTemp_stem _gsSqueakTemp_ind _gsSqueakTemp_sqPg |
	actionSelector == #goToPageMorph:fromBookmark: | (actionSelector == #goToPageMorph:)
		ifFalse: [^ super objectForDataStream: refStrm].
	"normal case"
	target url
		ifNil: ["Later force target book to get a url."
			_gsSqueakTemp_bb := SimpleButtonMorph new.
			"write out a dummy"
			_gsSqueakTemp_bb label: self label.
			_gsSqueakTemp_bb bounds: bounds.
			refStrm replace: self with: _gsSqueakTemp_bb.
			^ _gsSqueakTemp_bb].
	(_gsSqueakTemp_thatPage := arguments first) url
		ifNil: ["Need to assign a url to a page that will be written later.
			It might have bookmarks too. Don't want to recurse deeply. 
			Have that page write out a dummy morph to save its url on
			the server."
			_gsSqueakTemp_stem := target getStemUrl.
			"know it has one"
			_gsSqueakTemp_ind := target pages identityIndexOf: _gsSqueakTemp_thatPage.
			_gsSqueakTemp_thatPage reserveUrl: _gsSqueakTemp_stem , _gsSqueakTemp_ind printString , '.sp'].
	_gsSqueakTemp_um := URLMorph newForURL: _gsSqueakTemp_thatPage url.
	_gsSqueakTemp_sqPg := _gsSqueakTemp_thatPage sqkPage clone.
	_gsSqueakTemp_sqPg contentsMorph: nil.
	_gsSqueakTemp_um setURL: _gsSqueakTemp_thatPage url page: _gsSqueakTemp_sqPg.
	(SqueakPage stemUrl: target url)
			= (SqueakPage stemUrl: _gsSqueakTemp_thatPage url)
		ifTrue: [_gsSqueakTemp_um book: true]
		ifFalse: [_gsSqueakTemp_um book: target url].
	"remember which book"
	_gsSqueakTemp_um privateOwner: owner.
	_gsSqueakTemp_um bounds: bounds.
	_gsSqueakTemp_um isBookmark: true;
		 label: self label.
	_gsSqueakTemp_um borderWidth: borderWidth;
		 borderColor: borderColor.
	_gsSqueakTemp_um color: color.
	refStrm replace: self with: _gsSqueakTemp_um.
	^ _gsSqueakTemp_um