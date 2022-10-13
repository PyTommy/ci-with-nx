import * as request from 'supertest';
import { app } from '.';

describe('api-1', () => {
  it('should response with 200', async () => {
    const res = await request(app).get('');
    expect(res.status).toBe(200);
  });
  it('should response with body.message', async () => {
    const res = await request(app).get('');
    expect(res.body.message).toBeDefined();
    expect(typeof res.body.message).toBe('string');
  });

  it('should response with body.from', async () => {
    const res = await request(app).get('');
    expect(res.body.from).toBeDefined();
    expect(typeof res.body.from).toBe('string');
  });
});
