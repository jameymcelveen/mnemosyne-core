#!/bin/bash
# MNEMOSYNE CORE - SYNAPSE INITIALIZATION
# "The Brain to the Machine"

echo "Firing synapses... Building project structure."

# 1. Create Memory Vault (ai.md)
echo "# Mnemosyne Core: Project Memory Vault
## User Profile: Jamey McElveen
- **Persona:** Senior Architect (est. 1996), 6'5\", 344 lbs, 52 yrs.
- **Goal:** Health for grandkids, retirement on GA river.
- **Style:** Dracula Sneeze (Discreet, Efficient).

## Established Vernacular
- 'Same': Repeat last set/reps/weight.
- 'Up [X]': Increment weight.
- '3x8@100': Standard log format." > ai.md

# 2. Create Data Schema (schema.json)
echo '{
  "user_id": "jameymcelveen",
  "preferences": {
    "units": "imperial",
    "interaction_mode": "discreet"
  },
  "shorthand_map": {
    "same": "repeat_last",
    "up": "increment_weight"
  },
  "history": []
}' > schema.json

# 3. Create Core Engine Logic (engine.ts)
echo "/**
 * Mnemosyne Engine: The 'Invisible Coach' Logic
 */
export function processNfcCommand(input: string, lastLog: any) {
  const command = input.toLowerCase().trim();
  
  if (command === 'same') {
    return { ...lastLog, date: new Date().toISOString(), status: 'repeated' };
  }
  
  if (command.startsWith('up')) {
    const amount = parseInt(command.replace('up', '').trim()) || 5;
    return { 
      ...lastLog, 
      weight: lastLog.weight + amount,
      date: new Date().toISOString(),
      status: 'incremented'
    };
  }
  return null;
}" > engine.ts

# 4. Create README
echo "# Mnemosyne Core
Built for the 'Digital Mom & Pop' life.
Invisible coaching via NFC and AI logic." > README.md

echo "Synapses fired. Files created. You're clear to rest, Jamey."