import { WebPlugin } from '@capacitor/core';
import { EmailComposerPlugin } from './definitions';

export class EmailComposerWeb extends WebPlugin implements EmailComposerPlugin {
  constructor() {
    super({
      name: 'EmailComposer',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}

const EmailComposer = new EmailComposerWeb();

export { EmailComposer };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(EmailComposer);
