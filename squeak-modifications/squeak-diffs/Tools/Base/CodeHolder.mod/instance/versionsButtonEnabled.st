toolbuilder
versionsButtonEnabled
	"The versions button is only enabled when a method is selected or we view the 
	class comment."

	^  self selectedMessageName notNil or: [self classCommentIndicated]