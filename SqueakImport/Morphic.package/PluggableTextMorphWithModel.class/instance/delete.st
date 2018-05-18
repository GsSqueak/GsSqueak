submorphs-add/remove
delete
	"Delete the receiver.  Since I have myself as a dependent, I need to remove it. which is odd in itself.  Also, the release of dependents will seemingly not be done if the *container* of the receiver is deleted rather than the receiver itself, a further problem"

	self removeDependent: self.
	super delete