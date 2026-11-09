#!/bin/bash

# NESTPOD Deployment Script — Phase 1
# Usage: bash DEPLOY.sh

echo "🚀 NESTPOD Deployment — Phase 1"
echo "================================"
echo ""

# Step 1: Check Prerequisites
echo "✓ Checking prerequisites..."
command -v node >/dev/null 2>&1 || { echo "❌ Node.js not found. Install Node 18+"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "❌ npm not found"; exit 1; }
command -v vercel >/dev/null 2>&1 || { echo "⚠️  Vercel CLI not found. Install: npm i -g vercel"; }
command -v supabase >/dev/null 2>&1 || { echo "⚠️  Supabase CLI not found. Install: npm i -g supabase"; }

# Step 2: Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Step 3: Build
echo ""
echo "🔨 Building Next.js project..."
npm run build

# Step 4: Deploy to Vercel
echo ""
echo "🌐 Deploying to Vercel..."
npm run deploy

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Next steps:"
echo "1. Copy Supabase credentials to .env.local"
echo "2. Update DNS nameservers at registrar"
echo "3. Wait for DNS propagation (2-24 hours)"
echo ""
echo "For manual steps, see: PHASE-1-EXECUTION-GUIDE.md"
