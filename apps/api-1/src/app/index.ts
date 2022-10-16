import * as express from 'express';
import { loveMessageGenerator } from '@ci-with-nx/love-message-generator';

const app = express();

app.get('*', (req, res) => {
  const message = loveMessageGenerator();
  const from = 'api-1-v1';
  res.send({ message, from });
});

export { app };
