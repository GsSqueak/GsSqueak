private
cmdWording
	"Answer the wording to be used to refer to the command in a menu"
	^ cmdWording
		ifNil: ['last command' translated]