/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Signature Hybrid C: 5-color palette
        primary: '#1A3A52',      // Deep Navy
        secondary: '#E8D4C4',    // Warm Beige
        accent: '#2E8B9E',       // Teal
        neutral: '#F5F3F0',      // Light Off-White
        dark: '#0F2438',         // Dark Navy
      },
      fontSize: {
        'xl': '1.25rem',
        '2xl': '1.5rem',
        '3xl': '2rem',
        '4xl': '2.5rem',
      },
    },
  },
  plugins: [],
};
