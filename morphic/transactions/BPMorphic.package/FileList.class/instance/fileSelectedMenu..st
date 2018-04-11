file list menu
fileSelectedMenu: aMenu 
	| _gsSqueakTemp_firstItems _gsSqueakTemp_secondItems _gsSqueakTemp_thirdItems _gsSqueakTemp_n1 _gsSqueakTemp_n2 _gsSqueakTemp_n3 _gsSqueakTemp_services |
	_gsSqueakTemp_firstItems := self itemsForFile: self fullName.
	_gsSqueakTemp_secondItems := self itemsForAnyFile.
	_gsSqueakTemp_thirdItems := self itemsForNoFile.
	_gsSqueakTemp_n1 := _gsSqueakTemp_firstItems size.
	_gsSqueakTemp_n2 := _gsSqueakTemp_n1 + _gsSqueakTemp_secondItems size.
	_gsSqueakTemp_n3 := _gsSqueakTemp_n2 + _gsSqueakTemp_thirdItems size.
	_gsSqueakTemp_services := _gsSqueakTemp_firstItems , _gsSqueakTemp_secondItems , _gsSqueakTemp_thirdItems , self serviceAllFileOptions.
	_gsSqueakTemp_services
		do: [:svc | svc addDependent: self].
	^ aMenu
		addServices2: _gsSqueakTemp_services
		for: self
		extraLines: (Array
				with: _gsSqueakTemp_n1
				with: _gsSqueakTemp_n2
				with: _gsSqueakTemp_n3)