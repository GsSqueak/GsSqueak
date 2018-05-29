pluggable menus - hooks
systemCategoryMenuHook: aMenu shifted: aBoolean
	<systemCategoryMenu>
	<menuPriority: 400>
	^ self menuHook: aMenu named: #systemCategoryMenu shifted: aBoolean.
