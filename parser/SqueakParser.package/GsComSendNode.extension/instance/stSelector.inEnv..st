*SqueakParser
stSelector: aSymbol inEnv: env
  selLeaf := GsComSelectorLeaf newSelector: aSymbol env: env.
  envFlags := env