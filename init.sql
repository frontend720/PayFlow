-- Users Table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    balance_cents INTEGER DEFAULT 0 -- Store money in cents to avoid floating point errors!
);

-- Transactions Table
CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID REFERENCES users(id),
    receiver_id UUID REFERENCES users(id),
    amount_cents INTEGER NOT NULL,
    status TEXT DEFAULT 'pending', -- pending, completed, failed
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);