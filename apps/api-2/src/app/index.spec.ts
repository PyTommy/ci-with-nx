import * as request from 'supertest';
import { app } from '.';

describe('api-2', () => {
  it('should response with 200', async () => {
    const res = await request(app).get('');
    expect(res.status).toBe(200);
  });
  it('should response with message', async () => {
    const res = await request(app).get('');
    expect(res.body.message).toBeDefined();
    expect(typeof res.body.message).toBe('string');
  });
});
