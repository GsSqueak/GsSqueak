accessing
sourceText

	^ (self actualClass sourceCodeAt: self selector env: self envId ifAbsent: ['Missing']) asText makeSelectorBoldIn: Object