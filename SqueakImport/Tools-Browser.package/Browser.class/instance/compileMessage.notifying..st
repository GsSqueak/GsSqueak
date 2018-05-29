code pane
compileMessage: aText notifying: aController
	"Compile the code that was accepted by the user, placing the compiled method into an appropriate message category.  Return true if the compilation succeeded, else false."
	| fallBackCategoryName originalSelectorName result fallBackMethodName |
	self selectedMessageCategoryName = ClassOrganizer allCategory
		ifTrue:
			[ "User tried to save a method while the ALL category was selected"
			fallBackCategoryName := selectedMessageCategoryName.
			fallBackMethodName := selectedMessageName.
			editSelection == #newMessage
				ifTrue:
					[ "Select the 'as yet unclassified' category"
					selectedMessageCategoryName := nil.
					(result := self defineMessageFrom: aText notifying: aController)
						ifNil:
							["Compilation failure:  reselect the original category & method"
							selectedMessageCategoryName := fallBackCategoryName.
							selectedMessageName := fallBackMethodName]
						ifNotNil:
							[self setSelector: result]]
				ifFalse:
					[originalSelectorName := self selectedMessageName.
					self setOriginalCategoryIndexForCurrentMethod.
					selectedMessageName := fallBackMethodName := originalSelectorName.			
					(result := self defineMessageFrom: aText notifying: aController)
						ifNotNil:
							[self setSelector: result]
						ifNil:
							[ "Compilation failure:  reselect the original category & method"
							selectedMessageCategoryName := fallBackCategoryName.
							selectedMessageName := fallBackMethodName.
							^ result notNil]].
			self changed: #messageCategoryList.
			^ result notNil]
		ifFalse:
			[ "User tried to save a method while the ALL category was NOT selected"
			^ (self defineMessageFrom: aText notifying: aController) notNil]