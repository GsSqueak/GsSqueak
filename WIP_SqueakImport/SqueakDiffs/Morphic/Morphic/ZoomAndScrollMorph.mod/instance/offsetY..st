scripting
offsetY: aNumber

	| transform |

	transform := self myTransformMorph.
	transform offset: transform offset x @ aNumber
