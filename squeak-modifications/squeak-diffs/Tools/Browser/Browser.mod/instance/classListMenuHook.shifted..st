pluggable menus - hooks
classListMenuHook: aMenu shifted: aBoolean
	<classListMenu>
	<menuPriority: 400>
	^ self menuHook: aMenu named: #classListMenu shifted: aBoolean.
