import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'NESTPOD — Capsule Homes for Exceptional Projects',
  description: 'Engineered Spaces. Endless Possibilities. Discover six distinctive modular home models designed for residential, commercial, and specialized projects.',
  viewport: 'width=device-width, initial-scale=1, maximum-scale=5',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <link rel="icon" href="/favicon.ico" />
      </head>
      <body>
        <header className="bg-primary text-white sticky top-0 z-50">
          <nav className="container flex justify-between items-center py-4">
            <div className="text-2xl font-bold">NESTPOD</div>
            <ul className="flex gap-6">
              <li><a href="#models">Models</a></li>
              <li><a href="#solutions">Solutions</a></li>
              <li><a href="#showrooms">Showrooms</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </nav>
        </header>
        <main>{children}</main>
        <footer className="bg-dark text-white py-8">
          <div className="container text-center">
            <p>&copy; 2026 NESTPOD. All rights reserved.</p>
            <p className="text-sm mt-2">Engineered Spaces. Endless Possibilities.</p>
          </div>
        </footer>
      </body>
    </html>
  );
}
