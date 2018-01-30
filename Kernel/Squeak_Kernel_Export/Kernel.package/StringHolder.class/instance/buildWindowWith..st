toolbuilder
buildWindowWith: builder
	| windowSpec |
	windowSpec := builder pluggableWindowSpec new.
	windowSpec model: self.
	windowSpec label: #labelString.
	windowSpec children: OrderedCollection new.
	^windowSpec