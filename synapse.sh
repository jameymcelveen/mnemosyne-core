#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.7 (Idempotent Persistence)

echo "Checking synapses for idempotency..."

# 1. Check for .env.example
if [ ! -f .env.example ]; then
    echo "Creating .env.example..."
    echo "DATABASE_URL=postgresql://postgres:[PASSWORD]@db.[REF].supabase.co:5432/postgres
SUPABASE_ANON_KEY=your-anon-key-here
GEMINI_API_KEY=your-gemini-key-here
PORT=3000" > .env.example
fi

# 2. Add Supabase Client to engine.ts (Only if not present)
if ! grep -q "from '@supabase/supabase-js'" engine.ts; then
    echo "Injecting Supabase persistence logic..."
    sed -i '' '1s/^/import { createClient } from "@supabase\/supabase-js";\n/' engine.ts
    
    echo "
const supabase = createClient(
  process.env.SUPABASE_URL || '',
  process.env.SUPABASE_ANON_KEY || ''
);

export async function saveWorkout(log: any) {
  const { data, error } = await supabase.from('workout_logs').insert([log]);
  if (error) console.error('Supabase Error:', error);
  return data;
}" >> engine.ts
else
    echo "Supabase logic already exists in engine.ts. Skipping."
fi

echo "Synapse update complete. System state is stable."