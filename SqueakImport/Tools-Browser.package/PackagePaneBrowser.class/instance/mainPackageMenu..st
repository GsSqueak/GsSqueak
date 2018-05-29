package list
mainPackageMenu: aMenu
	"Answer a Menu of operations on class packages to be 
	displayed when the operate menu button is pressed."
	<packageListMenu>
	^aMenu addList: #(
			('find class...'		findClass)
			('recent classes...'	recent)
			-
			('reorganize'		editSystemCategories)
			('update'			updatePackages));
		yourself.
