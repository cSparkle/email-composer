declare module '@capacitor/core' {
  interface PluginRegistry {
    EmailComposer: EmailComposerPlugin;
  }
}

export interface EmailComposerPlugin {
  openEmail(options: {
    to: string;
    from: string;
    subject: string;
    body: string;
  }): Promise<{ value: string }>;
}
