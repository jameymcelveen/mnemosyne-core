#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.5 (The Dev-Ops Fire)

# 1. Create a Docker Compose for Local Dev
echo "version: '3.8'
services:
  app:
    build: .
    volumes:
      - .:/app
    environment:
      - NODE_ENV=development" > docker-compose.yml

# 2. Create a Dockerfile
echo "FROM node:18-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD [\"npm\", \"test\"]" > Dockerfile

# 3. Create a Vitest Unit Test for the 'Stealth Coach'
mkdir -p tests
echo "import { coachAdvice } from '../engine';
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
});" > tests/engine.test.ts

# 4. Initialize package.json
echo '{
  "name": "mnemosyne-core",
  "version": "1.0.0",
  "scripts": {
    "test": "vitest run"
  },
  "devDependencies": {
    "vitest": "^0.34.0",
    "typescript": "^5.0.0"
  }
}' > package.json

echo "Dockerized environment and Unit Tests established. Your architecture is now professional-grade."