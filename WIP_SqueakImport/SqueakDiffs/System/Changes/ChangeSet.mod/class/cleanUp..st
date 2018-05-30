current changeset
cleanUp: aggressive
	"Only delete change sets when being aggressive"

	aggressive ifTrue:[
		ChangeSet  removeChangeSetsNamedSuchThat:
			[:cs| cs name ~= ChangeSet current name].
		ChangeSet current clear.
		ChangeSet current name: 'Unnamed1'.
	].