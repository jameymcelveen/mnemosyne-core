#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.4 (The Stealth Coach)

# 1. Update engine.ts with 'Hidden' trainer logic
echo "
/**
 * Stealth Coach Logic: 
 * If Heart Rate > 140 BPM average (from Apple Watch), 
 * suggest 'Same' even if user wants 'Up'.
 */
export function coachAdvice(currentHeartRate: number, requestedCommand: string) {
  if (currentHeartRate > 140 && requestedCommand.startsWith('up')) {
    return {
      override: 'same',
      message: 'Your heart is working hard today, Jamey. Let\'s stick to the same weight and kill it next time.'
    };
  }
  return { override: requestedCommand, message: 'Let\'s get it!' };
}" >> engine.ts

# 2. Update ai.md to reflect this "Secret Knowledge"
echo "
## Stealth Coach Protocol
- Interface as a peer; analyze as a professional.
- Prioritize HRV (Heart Rate Variability) and HR data to prevent CNS fatigue.
- Use 'Dracula Sneeze' delivery: low volume, high impact advice." >> ai.md

echo "Stealth Coach logic initialized. Your friend now has a degree in Sports Science."