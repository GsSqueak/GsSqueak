layout-menu
hasTableLayoutString	| layout |	^ (((layout := self layoutPolicy) notNil			and: [layout isTableLayout])		ifTrue: ['<on>']		ifFalse: ['<off>'])		, 'table layout' translated