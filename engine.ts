/**
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
}
