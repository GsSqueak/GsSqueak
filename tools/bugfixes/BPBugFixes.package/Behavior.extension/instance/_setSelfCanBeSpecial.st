*BPBugFixes
_setSelfCanBeSpecial
| fmt |
fmt := format bitOr: 16r2000 .
self _unsafeAt: 2 put: fmt
