import { processNfcCommand } from './engine';
import db from './db.json';

export function handleTap(nfcId: string, command: string) {
  const machine = db.find(m => m.nfc_id === nfcId);
  if (!machine) return 'Machine not found. Want to register it?';

  const result = processNfcCommand(command, { weight: machine.last_weight });
  return `Logged ${machine.name}: ${result.weight} ${machine.unit}`;
}
