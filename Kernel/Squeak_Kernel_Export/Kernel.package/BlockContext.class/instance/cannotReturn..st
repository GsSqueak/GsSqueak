private
cannotReturn: result
	"The receiver tried to return result to a method context that no longer exists."

	| ex newResult |
	ex := BlockCannotReturn new.
	ex result: result.
	newResult := ex signal.
	^newResult