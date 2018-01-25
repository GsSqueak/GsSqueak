closure support
doItScope
	"scope (environment) for expressions executed within a method context. self will be the receiver of the do-it method. We want temp vars directly accessible"

	^ self methodNode scope asDoItScope