widgets required
buildPluggableMenu: menuSpec 
	| _gsSqueakTemp_prior _gsSqueakTemp_menu |
	_gsSqueakTemp_prior := parentMenu.
	parentMenu := _gsSqueakTemp_menu := self menuClass new.
	menuSpec label
		ifNotNil: [parentMenu addTitle: menuSpec label].
	menuSpec items
		do: [:each | each buildWith: self].
	parentMenu := _gsSqueakTemp_prior.
	^ _gsSqueakTemp_menu