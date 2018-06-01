private
advance: anInteger containingDirectoriesFrom: aDirectory

	| theDirectory |
	theDirectory := aDirectory.
	1 to: anInteger do: [:i | theDirectory := theDirectory containingDirectory].
	^theDirectory