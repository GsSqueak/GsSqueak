layout-menu
hasDisableTableLayoutString	^ (self disableTableLayout		ifTrue: ['<on>']		ifFalse: ['<off>'])		, 'disable layout in tables' translated