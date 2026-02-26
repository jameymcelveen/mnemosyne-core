#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.7 (Cloud Persistence)

# 1. Add the Database Connection logic to engine.ts
echo "
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
}" >> engine.ts

echo "Cloud persistence logic added. The 'Invisible Coach' now has a permanent memory."