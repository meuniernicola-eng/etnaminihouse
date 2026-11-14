'use client';

export default function Home() {
  return (
    <>
      {/* HERO */}
      <section id="hero" className="bg-primary text-white text-center py-20">
        <div className="container">
          <h1 className="text-5xl font-bold mb-4">NESTPOD</h1>
          <p className="text-2xl mb-8">Capsule Homes for Exceptional Projects</p>
          <p className="text-lg mb-8 max-w-2xl mx-auto">Engineered Spaces. Endless Possibilities.</p>
          <p className="text-neutral mb-8">Discover six distinctive modular home models designed for residential, commercial, and specialized projects.</p>
          <button className="bg-accent text-white px-8 py-3 rounded-lg font-bold hover:bg-opacity-90">
            Explore Models
          </button>
        </div>
      </section>

      {/* MODELS */}
      <section id="models" className="bg-neutral py-16">
        <div className="container">
          <h2 className="text-4xl font-bold text-center mb-12">Our Models</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {[
              { name: 'ELEVATE P40', image: '/images/models/p40.svg' },
              { name: 'PANORAMA A40', image: '/images/models/a40.svg' },
              { name: 'VIBE X60', image: '/images/models/x60.svg' },
              { name: 'SERENITY S50', image: '/images/models/s50.svg' },
              { name: 'FLOW F45', image: '/images/models/f45.svg' },
              { name: 'HORIZON H70', image: '/images/models/h70.svg' },
            ].map((model) => (
              <div key={model.name} className="bg-white rounded-lg shadow-lg hover:shadow-xl transition overflow-hidden">
                <div className="h-48 bg-gray-100 overflow-hidden">
                  <img src={model.image} alt={model.name} className="w-full h-full object-cover" />
                </div>
                <div className="p-8">
                  <h3 className="text-2xl font-bold mb-4 text-primary">{model.name}</h3>
                  <p className="text-gray-600 mb-6">Premium modular capsule home designed for quality and sustainability.</p>
                  <button className="text-accent font-bold hover:text-primary">Learn More →</button>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* SOLUTIONS */}
      <section id="solutions" className="bg-white py-16">
        <div className="container">
          <h2 className="text-4xl font-bold text-center mb-12">Applications</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {[
              { title: 'Residential', desc: 'Primary homes and secondary residences', icon: '🏠' },
              { title: 'Commercial', desc: 'Hospitality, glamping, rental units', icon: '🏢' },
              { title: 'Specialized', desc: 'Custom projects and enterprises', icon: '⚙️' },
              { title: 'Development', desc: 'Community planning and land optimization', icon: '🏗️' },
            ].map((sol) => (
              <div key={sol.title} className="border-l-4 border-accent pl-6 py-4">
                <div className="text-4xl mb-2">{sol.icon}</div>
                <h3 className="text-2xl font-bold mb-2 text-primary">{sol.title}</h3>
                <p className="text-gray-600">{sol.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* SHOWROOMS */}
      <section id="showrooms" className="bg-neutral py-16">
        <div className="container">
          <h2 className="text-4xl font-bold text-center mb-12">Visit Us</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="bg-white rounded-lg shadow overflow-hidden">
              <div className="h-40 bg-gray-100 overflow-hidden">
                <img src="/images/showrooms/floride.svg" alt="Floride Showroom" className="w-full h-full object-cover" />
              </div>
              <div className="p-8">
                <h3 className="text-2xl font-bold mb-4 text-primary">Floride</h3>
                <p className="mb-2"><strong>Address:</strong> 4841 SW Zarrella St, Palm City, FL 34990</p>
                <p className="mb-2"><strong>Model:</strong> ELEVATE P40</p>
                <p className="mb-2"><strong>Contact:</strong> Nic Meunier</p>
                <p className="mb-4"><strong>Hours:</strong> By appointment: 9 AM - 8 PM</p>
                <a href="tel:+14384991150" className="text-accent font-bold">+1 438-499-1150</a>
              </div>
            </div>
            <div className="bg-white rounded-lg shadow overflow-hidden">
              <div className="h-40 bg-gray-100 overflow-hidden">
                <img src="/images/showrooms/quebec.svg" alt="Québec Showroom" className="w-full h-full object-cover" />
              </div>
              <div className="p-8">
                <h3 className="text-2xl font-bold mb-4 text-primary">Québec</h3>
                <p className="mb-2"><strong>Address:</strong> 58 rue Rogel-Lamoureux, Saint-Cyprien-de-Napierville, QC J0J 1L0</p>
                <p className="mb-2"><strong>Model:</strong> PANORAMA A40</p>
                <p className="mb-2"><strong>Monday:</strong> Alain Oullette (8 AM - 6 PM)</p>
                <p className="mb-4"><strong>Thursday:</strong> Mickeal Bibeau (3 PM - 8 PM)</p>
                <a href="tel:+14384991150" className="text-accent font-bold">+1 438-499-1150</a>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* TEAM */}
      <section id="team" className="bg-white py-16">
        <div className="container">
          <h2 className="text-4xl font-bold text-center mb-12">Our Team</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6">
            {[
              { name: 'Nic Meunier', role: 'CEO & Brand Ambassador', phone: '+1 438-499-1150' },
              { name: 'Mickeal Bibeau', role: 'Representative & Developer', phone: '+1 514-701-3917' },
              { name: 'Marie-Soleil Lemay', role: 'Sales Representative', phone: '+1 819-609-6413' },
              { name: 'Alain Oullette', role: 'Sales Representative', phone: '+1 438-505-5919' },
              { name: 'Ian Sevigny', role: 'Sales Representative', phone: '+1 514-969-1222' },
            ].map((member) => (
              <div key={member.name} className="text-center">
                <div className="bg-primary text-white rounded-full w-24 h-24 mx-auto mb-4 flex items-center justify-center font-bold text-2xl">
                  {member.name.split(' ').map(n => n[0]).join('')}
                </div>
                <h3 className="font-bold text-lg text-primary">{member.name}</h3>
                <p className="text-sm text-gray-600 mb-2">{member.role}</p>
                <a href={`tel:${member.phone}`} className="text-accent text-xs hover:font-bold">
                  {member.phone}
                </a>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CONTACT FORM */}
      <section id="contact" className="bg-primary text-white py-16">
        <div className="container max-w-2xl">
          <h2 className="text-4xl font-bold text-center mb-12">Get in Touch</h2>
          <form className="space-y-6">
            <div>
              <label className="block mb-2 font-bold">Name</label>
              <input type="text" placeholder="Your name" className="w-full p-3 rounded text-dark" />
            </div>
            <div>
              <label className="block mb-2 font-bold">Email</label>
              <input type="email" placeholder="your@email.com" className="w-full p-3 rounded text-dark" />
            </div>
            <div>
              <label className="block mb-2 font-bold">Message</label>
              <textarea placeholder="Your message..." rows={5} className="w-full p-3 rounded text-dark"></textarea>
            </div>
            <button type="submit" className="w-full bg-accent text-white font-bold py-3 rounded hover:bg-opacity-90">
              Send Message
            </button>
          </form>
          <p className="text-center text-sm mt-8 text-neutral">Or contact us directly: meunier.nicola@gmail.com</p>
        </div>
      </section>
    </>
  );
}
