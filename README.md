# NESTPOD — Capsule Homes for Exceptional Projects

**Engineered Spaces. Endless Possibilities.**

## Quick Start

### Prerequisites
- Node.js 18+
- npm 9+
- Vercel account (vercel.com)
- Supabase account (supabase.com)
- Domain: ethnaminihouse.com

### Local Development

```bash
# Install dependencies
npm install

# Create .env.local with Supabase keys
cp .env.example .env.local
# Edit .env.local and add your Supabase credentials

# Run development server
npm run dev

# Open http://localhost:3000
```

### Deploy to Production

```bash
# Option 1: Automated deployment script
bash DEPLOY.sh

# Option 2: Manual deployment
npm run build
npm run deploy
```

## Project Structure

```
nestpod-site/
├── app/                    # Next.js app directory
│   ├── layout.tsx         # Root layout (header, footer)
│   ├── page.tsx           # Homepage (8 sections)
│   └── globals.css        # Global styles
├── components/            # Reusable React components
├── public/                # Static assets
├── package.json
├── next.config.js
├── tailwind.config.js
├── tsconfig.json
└── .env.example          # Environment variables template
```

## 8 Sections

1. **Hero** - Brand positioning
2. **Models** - 6 capsule home models
3. **Solutions** - 4 use cases (residential, commercial, specialized, development)
4. **Showrooms** - Floride & Québec locations
5. **Team** - 5 team members with contact info
6. **Contact Form** - Lead capture form
7. **Navigation** - Sticky header with sections
8. **Footer** - Copyright and branding

## Design System (Signature Hybrid C)

### Colors
- **Primary:** #1A3A52 (Deep Navy)
- **Secondary:** #E8D4C4 (Warm Beige)
- **Accent:** #2E8B9E (Teal)
- **Neutral:** #F5F3F0 (Light Off-White)
- **Dark:** #0F2438 (Dark Navy)

### Responsive Breakpoints
- Mobile: 320px - 640px
- Tablet: 640px - 1024px
- Desktop: 1024px+

## Environment Variables

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
NEXT_PUBLIC_GA_ID=your-google-analytics-id
```

## Deployment

### Vercel (Hosting)
- Free tier includes: auto-scaling, global CDN, analytics
- Command: `npm run deploy`

### Supabase (Database)
- Free tier includes: 500MB storage, 2M API calls/month
- 6 core tables: models, solutions, showrooms, projects, team, vault_documents

### Domain (ethnaminihouse.com)
- Nameservers: ns1.vercel-dns.com, ns2.vercel-dns.com
- HTTPS: Automatic provisioning via Vercel

## For More Information

- **Phase 1 Execution Guide:** See `PHASE-1-EXECUTION-GUIDE.md` in project folder
- **Showroom Configuration:** See `SHOWROOM-FINAL-CONFIG.md`
- **Deployment Roadmap:** See `DEPLOYMENT-ROADMAP-FINAL.md`
- **Content Admin Guide:** See `CONTENT-ADMIN-GUIDE.md`

## Support

Contact: meunier.nicola@gmail.com  
Phone: +1 438-499-1150

---

**Status:** Production Ready  
**Last Updated:** November 9, 2026  
**Deployed:** ethnaminihouse.com
