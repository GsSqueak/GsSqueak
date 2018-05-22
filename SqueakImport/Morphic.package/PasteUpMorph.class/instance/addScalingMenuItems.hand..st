menu & halo
addScalingMenuItems: menu hand: aHandMorph

	| subMenu |

	(subMenu := MenuMorph new)
		defaultTarget: self;
		add: 'show application view' translated action: #showApplicationView;
		add: 'show factory view' translated action: #showFactoryView;
		add: 'show whole world view' translated action: #showFullView;
		add: 'expand' translated action: #showExpandedView;
		add: 'reduce' translated action: #showReducedView;
		addLine;
		add: 'define application view' translated action: #defineApplicationView;
		add: 'define factory view' translated action: #defineFactoryView.
	menu
		add: 'world scale and clip...' translated
		subMenu: subMenu