pluggable menus - hooks
messageListMenuHook: aMenu shifted: aBoolean
	<messageListMenu>
	<menuPriority: 400>
	^ self menuHook: aMenu named: #messageListMenu shifted: aBoolean.
