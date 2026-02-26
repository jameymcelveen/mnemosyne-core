-- Mnemosyne Core: Database Schema v1.0
-- Focus: Longevity and Minimalist Interaction

CREATE TABLE profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE,
  full_name TEXT,
  height_inches INT DEFAULT 77, -- 6'5" default for the Architect
  weight_lbs FLOAT,
  goal_metric TEXT DEFAULT 'legacy_time',
  PRIMARY KEY (id)
);

CREATE TABLE machines (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nfc_id TEXT UNIQUE NOT NULL,
  machine_name TEXT NOT NULL,
  category TEXT DEFAULT 'strength', -- strength vs cardio
  base_increment FLOAT DEFAULT 5.0
);

CREATE TABLE workout_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES profiles(id),
  machine_id UUID REFERENCES machines(id),
  weight_used FLOAT,
  reps_completed INT,
  heart_rate_avg INT, -- Fed from Apple Watch
  created_at TIMESTAMPTZ DEFAULT now()
);