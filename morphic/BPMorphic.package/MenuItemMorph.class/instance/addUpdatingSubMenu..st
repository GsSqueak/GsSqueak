accessing
addUpdatingSubMenu: aBlock 
	subMenu := UpdatingMenuMorph new.
	subMenu updater: aBlock updateSelector: #value:.
	self changed