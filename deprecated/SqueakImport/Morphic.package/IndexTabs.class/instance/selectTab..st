selection
selectTab: aTab
	| aWorld |
	(aWorld := self world) ifNotNil: [aWorld abandonAllHalos].  "nil can happen at init time"
	self highlightTab: aTab.
