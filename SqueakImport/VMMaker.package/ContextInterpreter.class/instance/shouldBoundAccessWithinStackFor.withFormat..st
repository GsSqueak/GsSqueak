array primitive support
shouldBoundAccessWithinStackFor: header withFormat: format
	"Answer true if header describes a context object for which array access should
	not extend beyond the stack pointer, unless allowAccessBeyondSP has been
	set true.

	The allowAccessBeyondSP flag is set if we are running an older image, which
	in some cases may require copying method contexts prior to setting the stack
	pointer to its proper position. The normal setting for allowAccessBeyondSP is
	false, which prevents improper accesses beyond stack boundaries."

	<inline: true>
	^ (format = 3
		and: [allowAccessBeyondSP not])
			and: [self isContextHeader: header]
