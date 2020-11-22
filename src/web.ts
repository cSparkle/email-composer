import { WebPlugin } from '@capacitor/core';
import { EmailComposerPlugin } from './definitions';

export class EmailComposerWeb extends WebPlugin implements EmailComposerPlugin {
  constructor() {
    super({
      name: 'EmailComposer',
      platforms: ['web'],
    });
  }

  async openEmail(options: {
    to: string[];
    from: string;
    subject: string;
    body: string;
  }) {
    // TODO implement web version
    console.log('open email values are: ', options);
    return { value: 'success' };
  }
}

const EmailComposer = new EmailComposerWeb();

export { EmailComposer };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(EmailComposer);
