*SqueakEnvironments
bindingOf: varName environment: anEnvironment inEnvId: envId
  ^ (self superclassForEnv: envId) bindingOf: varName environment: anEnvironment