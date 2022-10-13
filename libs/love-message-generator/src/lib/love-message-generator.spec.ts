import { loveMessageGenerator } from './love-message-generator';

describe('loveMessageGenerator', () => {
  it('should return string', () => {
    expect(typeof loveMessageGenerator()).toEqual('string');
  });
});
