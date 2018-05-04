object access
fetchClassOfNonImm: oop
	"Only integers are immediate"
	<inline: true>
	^self fetchClassOfNonInt: oop