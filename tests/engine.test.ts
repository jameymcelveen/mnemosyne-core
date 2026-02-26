import { coachAdvice } from '../engine';
import { describe, it, expect } from 'vitest';

describe('Stealth Coach Logic', () => {
  it('should override UP to SAME if HR is too high', () => {
    const result = coachAdvice(150, 'up 5');
    expect(result.override).toBe('same');
    expect(result.message).toContain('heart is working hard');
  });

  it('should allow UP if HR is normal', () => {
    const result = coachAdvice(120, 'up 5');
    expect(result.override).toBe('up 5');
  });
});
