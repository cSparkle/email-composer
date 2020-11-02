declare module '@capacitor/core' {
  interface PluginRegistry {
    EmailComposer: EmailComposerPlugin;
  }
}

export interface EmailComposerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
