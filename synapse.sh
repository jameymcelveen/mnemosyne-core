#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.2 (The Router)

# 1. Create a Mock Database of your gym machines
echo '[
  {
    "nfc_id": "tag_001",
    "name": "Indoor Cycle",
    "last_weight": 0,
    "last_reps": 0,
    "unit": "level"
  },
  {
    "nfc_id": "tag_002",
    "name": "Lat Pulldown",
    "last_weight": 100,
    "last_reps": 8,
    "unit": "lbs"
  }
]' > db.json

# 2. Create the Router Logic
echo "import { processNfcCommand } from './engine';
import db from './db.json';

export function handleTap(nfcId: string, command: string) {
  const machine = db.find(m => m.nfc_id === nfcId);
  if (!machine) return 'Machine not found. Want to register it?';

  const result = processNfcCommand(command, { weight: machine.last_weight });
  return \`Logged \${machine.name}: \${result.weight} \${machine.unit}\`;
}" > router.ts

echo "Router and Mock DB added. The 'Invisible Coach' can now see the machines."