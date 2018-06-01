-Tools
offerDurableMenuFrom: menuRetriever shifted: aBoolean 
	"Pop up (morphic only) a menu whose target is the receiver and whose
	contents are provided by sending the menuRetriever to the receiver.
	The menuRetriever takes two arguments: a menu, and a boolean
	representing the shift state; put a stay-up item at the top of the
	menu. "
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_aMenu addStayUpItem.
	self
		perform: menuRetriever
		with: _gsSqueakTemp_aMenu
		with: aBoolean.
	_gsSqueakTemp_aMenu popUpInWorld