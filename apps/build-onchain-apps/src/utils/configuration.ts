import { Environment } from './environment';

export enum EnvironmentKeys {
  environment = 'ENVIRONMENT',
}

export function getCurrentEnvironment(): Environment {
  const stage: string | undefined = process.env[EnvironmentKeys.environment];

  if (stage === undefined) {
    return Environment.localhost;
  }

  // Convert string to ReleaseStage enum value
  const releaseStageValue = Object.values(Environment).find((value) => value === stage);

  return releaseStageValue ?? Environment.localhost;
}
