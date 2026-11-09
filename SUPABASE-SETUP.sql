-- ============================================
-- NESTPOD Database Setup SQL Script
-- Copy & paste ALL of this into Supabase SQL Editor
-- Then click RUN
-- ============================================

-- TABLE 1: Models
CREATE TABLE models (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  price_usd DECIMAL(10, 2),
  area_sqft INT,
  bedrooms INT,
  bathrooms INT,
  image_url TEXT,
  features JSONB DEFAULT '[]',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO models (name, slug, description, price_usd, area_sqft, bedrooms, bathrooms, image_url) VALUES
('ELEVATE P40', 'elevate-p40', 'Signature model: luxury entry-level capsule home', 85000, 400, 1, 1, '/images/models/p40.jpg'),
('PANORAMA A40', 'panorama-a40', 'Signature model: expanded space with panoramic living', 120000, 400, 1, 1.5, '/images/models/a40.jpg'),
('VIBE X60', 'vibe-x60', 'Premium model with enhanced features', 140000, 600, 2, 1.5, '/images/models/x60.jpg'),
('SERENITY S50', 'serenity-s50', 'Wellness-focused design with spa elements', 130000, 500, 1, 2, '/images/models/s50.jpg'),
('FLOW F45', 'flow-f45', 'Modern minimalist with open-plan living', 110000, 450, 1, 1, '/images/models/f45.jpg'),
('HORIZON H70', 'horizon-h70', 'Flagship model with premium finishes', 160000, 700, 2, 2, '/images/models/h70.jpg');

-- TABLE 2: Solutions
CREATE TABLE solutions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  icon TEXT,
  use_cases JSONB DEFAULT '[]',
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO solutions (title, slug, description, icon) VALUES
('Residential', 'residential', 'Primary homes and secondary residences', '🏠'),
('Commercial', 'commercial', 'Hospitality, glamping, and rental units', '🏢'),
('Specialized', 'specialized', 'Custom projects and enterprise deployments', '⚙️'),
('Development', 'development', 'Community planning and land optimization', '🏗️');

-- TABLE 3: Showrooms
CREATE TABLE showrooms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  location TEXT NOT NULL,
  address TEXT NOT NULL,
  city TEXT,
  region TEXT,
  country TEXT,
  phone TEXT,
  email TEXT NOT NULL,
  hours TEXT,
  models_present JSONB DEFAULT '[]',
  responsible_contacts JSONB DEFAULT '[]',
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO showrooms (location, address, city, region, country, phone, email, hours, models_present) VALUES
('Floride', '4841 SW Zarrella St, Palm City, FL 34990', 'Palm City', 'FL', 'USA', '+1 438-499-1150', 'meunier.nicola@gmail.com', 'By appointment: 9 AM - 8 PM', '["ELEVATE P40"]'),
('Québec', '58 rue Rogel-Lamoureux, Saint-Cyprien-de-Napierville, Québec J0J 1L0', 'Saint-Cyprien-de-Napierville', 'QC', 'Canada', '+1 438-499-1150', 'meunier.nicola@gmail.com', 'Mon: 8 AM - 6 PM (Alain) | Thu: 3 PM - 8 PM (Mickeal)', '["PANORAMA A40"]');

-- TABLE 4: Projects
CREATE TABLE projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  location TEXT,
  model_used TEXT,
  client_name TEXT,
  year INT,
  images JSONB DEFAULT '[]',
  results JSONB DEFAULT '[]',
  created_at TIMESTAMP DEFAULT NOW()
);

-- TABLE 5: Team
CREATE TABLE team (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  role TEXT NOT NULL,
  phone TEXT,
  email TEXT,
  bio TEXT,
  availability TEXT,
  avatar_url TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO team (name, role, phone, email, bio) VALUES
('Nic Meunier', 'CEO, Representative & Brand Ambassador', '+1 438-499-1150', 'meunier.nicola@gmail.com', 'Nic Meunier serves as CEO, representative, and brand ambassador for NESTPOD. His role combines company leadership with direct representation of the brand.'),
('Mickeal Bibeau', 'Representative & Developer', '+1 514-701-3917', NULL, 'Mickeal Bibeau serves as a representative and developer for NESTPOD. His role brings together client representation and project development. Thursdays at Québec showroom.'),
('Marie-Soleil Lemay', 'Sales Representative', '+1 819-609-6413', NULL, 'Marie-Soleil Lemay serves as a sales representative for NESTPOD. Her role provides a direct point of contact for people interested in the company capsule homes.'),
('Alain Oullette', 'Sales Representative', '+1 438-505-5919', NULL, 'Alain Oullette serves as a sales representative for NESTPOD. He is a point of contact for prospective clients exploring capsule homes. Mondays at Québec showroom.'),
('Ian Sevigny', 'Sales Representative', '+1 514-969-1222', NULL, 'Ian Sevigny serves as a sales representative for NESTPOD. His role connects prospective clients with the company capsule home offering.');

-- TABLE 6: Vault Documents
CREATE TABLE vault_documents (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  category TEXT,
  file_url TEXT NOT NULL,
  file_type TEXT,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- ENABLE ROW LEVEL SECURITY
-- ============================================
ALTER TABLE models ENABLE ROW LEVEL SECURITY;
ALTER TABLE solutions ENABLE ROW LEVEL SECURITY;
ALTER TABLE showrooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE team ENABLE ROW LEVEL SECURITY;
ALTER TABLE vault_documents ENABLE ROW LEVEL SECURITY;

-- PUBLIC READ ACCESS (No authentication required)
CREATE POLICY "models_readable" ON models FOR SELECT USING (true);
CREATE POLICY "solutions_readable" ON solutions FOR SELECT USING (true);
CREATE POLICY "showrooms_readable" ON showrooms FOR SELECT USING (true);
CREATE POLICY "projects_readable" ON projects FOR SELECT USING (true);
CREATE POLICY "team_readable" ON team FOR SELECT USING (true);
CREATE POLICY "vault_documents_readable" ON vault_documents FOR SELECT USING (true);

-- ============================================
-- SUCCESS! All tables created.
-- ============================================
-- Next steps:
-- 1. Go to Authentication → Users
-- 2. Create new user with email: meunier.nicola@gmail.com
-- 3. Go to Project Settings → API
-- 4. Copy Project URL and Anon Key
-- 5. Add to Vercel environment variables
-- ============================================
