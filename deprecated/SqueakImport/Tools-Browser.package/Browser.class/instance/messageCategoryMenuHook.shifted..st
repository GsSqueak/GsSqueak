pluggable menus - hooks
messageCategoryMenuHook: aMenu shifted: aBoolean
	<messageCategoryMenu>
	<menuPriority: 400>
	^ self menuHook: aMenu named: #messageCategoryMenu shifted: aBoolean.
