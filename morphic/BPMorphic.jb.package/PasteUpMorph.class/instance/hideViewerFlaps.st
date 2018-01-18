misc
hideViewerFlaps	self flapTabs		do: [:aTab | (aTab isKindOf: ViewerFlapTab)				ifTrue: [aTab hideFlap]]