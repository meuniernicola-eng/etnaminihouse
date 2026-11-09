# NESTPOD Phase 1 Automated Deployment
# PowerShell Script for Windows
# Usage: .\DEPLOY-AUTOMATED.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "NESTPOD Phase 1 - Automated Deployment" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Configuration
$EmailAdmin = "meunier.nicola@gmail.com"
$DomainName = "ethnaminihouse.com"
$ProjectName = "nestpod"

# Step 1: Check Prerequisites
Write-Host "Step 1: Checking Prerequisites..." -ForegroundColor Yellow

# Check Node.js
$NodeVersion = node --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Node.js installed: $NodeVersion" -ForegroundColor Green
} else {
    Write-Host "✗ Node.js NOT found. Install from nodejs.org" -ForegroundColor Red
    exit 1
}

# Check npm
$NpmVersion = npm --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ npm installed: $NpmVersion" -ForegroundColor Green
} else {
    Write-Host "✗ npm NOT found" -ForegroundColor Red
    exit 1
}

# Check Vercel CLI
$VercelVersion = vercel --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Vercel CLI installed: $VercelVersion" -ForegroundColor Green
} else {
    Write-Host "⚠ Vercel CLI not found. Installing..." -ForegroundColor Yellow
    npm install -g vercel
    Write-Host "✓ Vercel CLI installed" -ForegroundColor Green
}

# Check Supabase CLI
$SupabaseVersion = supabase --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Supabase CLI installed: $SupabaseVersion" -ForegroundColor Green
} else {
    Write-Host "⚠ Supabase CLI not found. Installing..." -ForegroundColor Yellow
    npm install -g supabase
    Write-Host "✓ Supabase CLI installed" -ForegroundColor Green
}

Write-Host ""

# Step 2: Install Dependencies
Write-Host "Step 2: Installing dependencies..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ npm install failed" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Dependencies installed" -ForegroundColor Green
Write-Host ""

# Step 3: Build Project
Write-Host "Step 3: Building Next.js project..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Build failed" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Build successful" -ForegroundColor Green
Write-Host ""

# Step 4: Deploy to Vercel
Write-Host "Step 4: Deploying to Vercel..." -ForegroundColor Yellow
Write-Host "You will be prompted to:" -ForegroundColor Cyan
Write-Host "  1. Confirm project settings" -ForegroundColor Cyan
Write-Host "  2. Set production domain (or skip - we'll add later)" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Enter to start Vercel deployment..." -ForegroundColor Cyan
Read-Host

npm run deploy

if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Vercel deployment failed" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✓ Vercel deployment complete!" -ForegroundColor Green
Write-Host ""

# Step 5: Supabase Instructions
Write-Host "Step 5: Supabase Setup (Manual)" -ForegroundColor Yellow
Write-Host ""
Write-Host "You must now create a Supabase project manually:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. Go to: https://supabase.com" -ForegroundColor Cyan
Write-Host "  2. Create new project" -ForegroundColor Cyan
Write-Host "     - Name: $ProjectName" -ForegroundColor Cyan
Write-Host "     - Region: us-east-1 (Florida)" -ForegroundColor Cyan
Write-Host "     - Database password: [create strong password]" -ForegroundColor Cyan
Write-Host "  3. Wait ~2 minutes for creation" -ForegroundColor Cyan
Write-Host "  4. Copy Project URL and Anon Key" -ForegroundColor Cyan
Write-Host ""

# Create .env.local template
Write-Host "Creating .env.local template..." -ForegroundColor Yellow

$EnvContent = @"
# Add these after creating Supabase project
NEXT_PUBLIC_SUPABASE_URL=https://YOUR-PROJECT.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR-ANON-KEY-HERE
NEXT_PUBLIC_GA_ID=
"@

$EnvContent | Out-File -FilePath ".env.local" -Encoding UTF8
Write-Host "✓ .env.local created (edit with your Supabase keys)" -ForegroundColor Green

Write-Host ""

# Step 6: SQL Setup
Write-Host "Step 6: Supabase SQL Setup" -ForegroundColor Yellow
Write-Host ""
Write-Host "Once Supabase project is created:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. In Supabase Dashboard → SQL Editor" -ForegroundColor Cyan
Write-Host "  2. Create New Query" -ForegroundColor Cyan
Write-Host "  3. Copy SQL from: PHASE-1-EXECUTION-GUIDE.md (Section STEP 2b)" -ForegroundColor Cyan
Write-Host "  4. Paste into Supabase SQL editor" -ForegroundColor Cyan
Write-Host "  5. Click 'Run'" -ForegroundColor Cyan
Write-Host "  6. Wait ~1 minute for all tables to be created" -ForegroundColor Cyan
Write-Host ""

# Step 7: Admin User
Write-Host "Step 7: Create Admin User" -ForegroundColor Yellow
Write-Host ""
Write-Host "In Supabase → Authentication → Users:" -ForegroundColor Cyan
Write-Host "  1. Click 'Add User'" -ForegroundColor Cyan
Write-Host "  2. Email: $EmailAdmin" -ForegroundColor Cyan
Write-Host "  3. Password: [your choice]" -ForegroundColor Cyan
Write-Host "  4. CHECK 'Confirm email'" -ForegroundColor Cyan
Write-Host "  5. Click 'Create User'" -ForegroundColor Cyan
Write-Host ""

# Step 8: Copy API Keys
Write-Host "Step 8: Add Supabase Keys to Vercel" -ForegroundColor Yellow
Write-Host ""
Write-Host "From Supabase → Project Settings → API:" -ForegroundColor Cyan
Write-Host "  1. Copy 'Project URL'" -ForegroundColor Cyan
Write-Host "  2. Copy 'anon (public)' key" -ForegroundColor Cyan
Write-Host ""
Write-Host "Add to Vercel (vercel.com → Your Project → Settings → Environment Variables):" -ForegroundColor Cyan
Write-Host "  Name: NEXT_PUBLIC_SUPABASE_URL" -ForegroundColor Cyan
Write-Host "  Value: [paste Project URL]" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Name: NEXT_PUBLIC_SUPABASE_ANON_KEY" -ForegroundColor Cyan
Write-Host "  Value: [paste anon key]" -ForegroundColor Cyan
Write-Host ""

# Step 9: DNS
Write-Host "Step 9: Update DNS Nameservers" -ForegroundColor Yellow
Write-Host ""
Write-Host "At your domain registrar (ethnaminihouse.com):" -ForegroundColor Cyan
Write-Host "  1. Login to registrar (GoDaddy, Namecheap, etc.)" -ForegroundColor Cyan
Write-Host "  2. Find DNS / Nameservers settings" -ForegroundColor Cyan
Write-Host "  3. Replace nameservers with:" -ForegroundColor Cyan
Write-Host "     - ns1.vercel-dns.com" -ForegroundColor Cyan
Write-Host "     - ns2.vercel-dns.com" -ForegroundColor Cyan
Write-Host "  4. Save changes" -ForegroundColor Cyan
Write-Host "  5. Wait 2-24 hours for DNS propagation" -ForegroundColor Cyan
Write-Host ""

# Step 10: Add Domain to Vercel
Write-Host "Step 10: Add Custom Domain to Vercel" -ForegroundColor Yellow
Write-Host ""
Write-Host "In Vercel Dashboard → Your Project → Settings → Domains:" -ForegroundColor Cyan
Write-Host "  1. Click 'Add Domain'" -ForegroundColor Cyan
Write-Host "  2. Enter: $DomainName" -ForegroundColor Cyan
Write-Host "  3. Click 'Add'" -ForegroundColor Cyan
Write-Host "  4. Status will show 'Pending' until DNS propagates" -ForegroundColor Cyan
Write-Host ""

# Final Summary
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "PHASE 1 DEPLOYMENT SUMMARY" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "✓ Step 1: Prerequisites checked" -ForegroundColor Green
Write-Host "✓ Step 2: Dependencies installed" -ForegroundColor Green
Write-Host "✓ Step 3: Project built" -ForegroundColor Green
Write-Host "✓ Step 4: Deployed to Vercel" -ForegroundColor Green
Write-Host "⏳ Step 5-10: Manual Supabase + DNS setup" -ForegroundColor Yellow
Write-Host ""
Write-Host "NEXT ACTIONS:" -ForegroundColor Cyan
Write-Host "  1. Create Supabase project (https://supabase.com)" -ForegroundColor Cyan
Write-Host "  2. Run SQL script in Supabase" -ForegroundColor Cyan
Write-Host "  3. Create admin user: $EmailAdmin" -ForegroundColor Cyan
Write-Host "  4. Copy API keys to Vercel" -ForegroundColor Cyan
Write-Host "  5. Update DNS nameservers" -ForegroundColor Cyan
Write-Host "  6. Add custom domain to Vercel" -ForegroundColor Cyan
Write-Host "  7. Wait for DNS propagation (2-24 hours)" -ForegroundColor Cyan
Write-Host ""
Write-Host "EXPECTED TIMELINE:" -ForegroundColor Cyan
Write-Host "  - Manual setup: 30-45 minutes" -ForegroundColor Cyan
Write-Host "  - DNS propagation: 2-24 hours" -ForegroundColor Cyan
Write-Host "  - Go-live: November 9-10, 2026" -ForegroundColor Cyan
Write-Host ""
Write-Host "For detailed instructions, see: DEPLOY-NOW-INSTRUCTIONS.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "READY! Report back when done." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
