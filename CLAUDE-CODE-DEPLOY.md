# NESTPOD Deployment with Claude Code

**For:** Nic Meunier  
**Using:** Claude Code CLI  
**Time:** ~45 minutes + DNS propagation  

---

## Option 1: Use Claude Code Agent to Deploy

```bash
# From terminal with Claude Code
claude code "Deploy NESTPOD to Vercel and Supabase:

1. Create Vercel project at vercel.com
2. Deploy with: npm run deploy
3. Create Supabase project at supabase.com
4. Run SQL script to create 6 tables
5. Create admin user with meunier.nicola@gmail.com
6. Copy API keys to .env.local
7. Redeploy to Vercel with keys
8. Update DNS at registrar: ethnaminihouse.com → Vercel nameservers
9. Verify: ethnaminihouse.com resolves

Reference: See DEPLOY-NOW-INSTRUCTIONS.md for detailed steps"
```

---

## Option 2: Manual Deployment (Step by Step)

```bash
# Clone/Navigate to project
cd ~/nestpod-site

# Step 1: Install dependencies
npm install

# Step 2: Build locally to verify no errors
npm run build

# Step 3: Deploy to Vercel
npm run deploy
# Follow prompts, confirm project creation
# Save the production URL (e.g., nestpod-abc123.vercel.app)

# Step 4: Create .env.local with your Supabase keys
# After you've created Supabase project and run SQL:
cp .env.example .env.local
# Edit and add:
# NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
# NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# Step 5: Redeploy with environment variables
npm run deploy

# Step 6: Add custom domain
vercel env add NEXT_PUBLIC_SUPABASE_URL
vercel env add NEXT_PUBLIC_SUPABASE_ANON_KEY
vercel --prod
```

---

## What Claude Code Agent Can Do For You

Using Claude Code CLI, you can:

1. **Create the Vercel project** — If you have Vercel CLI installed
2. **Deploy the code** — Automatically handles npm install → npm run build → vercel deploy
3. **Create Supabase project** — If you have Supabase CLI installed
4. **Run database setup** — Execute SQL script to create 6 tables
5. **Configure environment variables** — Inject API keys automatically
6. **Verify deployment** — Check that ethnaminihouse.com resolves

---

## Quick Reference

**Repository:** `/home/claude/nestpod-site/`  
**Main Branch:** `master` (ready to deploy)  
**Package Manager:** npm  
**Runtime:** Node.js 18+  
**Deployment Target:** Vercel  
**Database:** Supabase  
**Domain:** ethnaminihouse.com  

**Commands:**
```bash
npm install       # Install dependencies
npm run dev       # Local development
npm run build     # Production build
npm run deploy    # Deploy to Vercel
```

---

## Prerequisites

Before using Claude Code to deploy, ensure:

- [ ] Vercel CLI installed: `npm install -g vercel`
- [ ] Supabase CLI installed: `npm install -g supabase`
- [ ] Vercel account created and logged in
- [ ] Supabase account created
- [ ] Domain registrar access (ethnaminihouse.com)
- [ ] Node.js 18+ installed

---

## For More Information

See these files in the repository:

1. `DEPLOY-NOW-INSTRUCTIONS.md` — Step-by-step deployment guide
2. `PHASE-1-EXECUTION-GUIDE.md` — Detailed with SQL scripts
3. `README.md` — Quick reference
4. `SHOWROOM-FINAL-CONFIG.md` — Database configuration

---

## Support

Questions? See documentation files or contact:  
Email: meunier.nicola@gmail.com  
Phone: +1 438-499-1150

---

**Status:** ✅ Ready for Claude Code deployment
