menus
menuItemAfter: menuString 	| allWordings |	allWordings := self allMenuWordings.	^ allWordings atWrap: (allWordings indexOf: menuString)			+ 1