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
export function learnMachine(input: string, nfcId: string) {
  const isCardio = input.toLowerCase().includes('cycle') || input.toLowerCase().includes('treadmill');
  
  return {
    nfc_id: nfcId,
    name: input,
    last_weight: 0,
    last_reps: 0,
    unit: isCardio ? 'level' : 'lbs',
    category: isCardio ? 'cardio' : 'strength',
    created_at: new Date().toISOString()
  };
}

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
}

import { createClient } from '@supabase/supabase-js';

// Initialize Supabase (Variables will come from Railway)
const supabase = createClient(
  process.env.SUPABASE_URL || '',
  process.env.SUPABASE_ANON_KEY || ''
);

export async function saveWorkout(log: any) {
  const { data, error } = await supabase
    .from('workout_logs')
    .insert([log]);
    
  if (error) console.error('Error saving to Supabase:', error);
  return data;
}
