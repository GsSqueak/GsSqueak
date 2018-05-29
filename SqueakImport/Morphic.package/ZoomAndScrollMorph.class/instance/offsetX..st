scripting
offsetX: aNumber

	| transform |

	transform := self myTransformMorph.
	transform offset: aNumber @ transform offset y
