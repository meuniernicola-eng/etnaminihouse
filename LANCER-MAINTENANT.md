# 🚀 LANCER LE DÉPLOIEMENT MAINTENANT

**Nic, voici les 3 étapes pour lancer tout:**

---

## ÉTAPE 1: Ouvrir PowerShell dans le dossier

```powershell
# Dans le dossier nestpod-website:
# Clic droit → Open PowerShell here
# Ou tape dans PowerShell:
cd C:\Users\nicl\nestpod-website
```

---

## ÉTAPE 2: Permettre l'exécution du script

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

Réponds: `Y` (Yes)

---

## ÉTAPE 3: Lancer le script automatisé

```powershell
.\DEPLOY-AUTOMATED.ps1
```

**Ça va:**
✅ Vérifier Node.js + npm + Vercel CLI  
✅ Installer les dépendances  
✅ Build le projet  
✅ Déployer vers Vercel (tu devras confirmer une fois)  
✅ Afficher les étapes manuelles pour Supabase + DNS  

---

## ENSUITE (Étapes Manuelles - 30 min)

Le script va afficher des instructions pour:

1. **Créer un projet Supabase** (5 min)
   - Go to: https://supabase.com
   - Create project
   - Region: us-east-1

2. **Copier-coller le SQL** (5 min)
   - Fichier: `SUPABASE-SETUP.sql`
   - Supabase Dashboard → SQL Editor
   - Coller + Run

3. **Créer admin user** (2 min)
   - Supabase → Authentication → Users
   - Email: meunier.nicola@gmail.com

4. **Copier les clés API** (2 min)
   - Supabase → Project Settings → API
   - Copier URL + Anon Key

5. **Ajouter à Vercel** (5 min)
   - Vercel → Your Project → Environment Variables
   - Ajouter NEXT_PUBLIC_SUPABASE_URL
   - Ajouter NEXT_PUBLIC_SUPABASE_ANON_KEY

6. **Update DNS** (5 min)
   - Registraire ethnaminihouse.com
   - Nameservers → ns1.vercel-dns.com + ns2.vercel-dns.com

7. **Ajouter domaine à Vercel** (2 min)
   - Vercel → Settings → Domains
   - Ajouter ethnaminihouse.com

---

## ⏱️ TIMELINE

- **Maintenant:** Script (~15 min pour Vercel)
- **Après:** Étapes manuelles (~30 min pour Supabase + DNS)
- **Attendre:** DNS propagation (2-24 heures)
- **Résultat:** ethnaminihouse.com LIVE ✅

---

## 🔧 Si quelque chose ne marche pas

### "PowerShell security error"
→ Run: `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`

### "Node not found"
→ Install: https://nodejs.org (v18 or higher)

### "Vercel login failed"
→ Create account: https://vercel.com

### "Supabase SQL error"
→ Check: SUPABASE-SETUP.sql syntax (just copy-paste it all)

---

## 📞 Questions?

Contact: meunier.nicola@gmail.com  
Phone: +1 438-499-1150

---

**C'EST TOUT! Lances le script et suis les instructions.** 🚀

Report back when done: "Phase 1 complete ✅"
