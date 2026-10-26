# Society Management SaaS – UI Gallery

This gallery showcases all five personas across mobile (375px), tablet (768px), and desktop/wide (1280px) viewports in both **Light Mode** and **Dark Mode**.

---

## 1. Resident Persona
- **Mobile (375px):** [Light Mode](resident_375_light.png) • [Dark Mode](resident_375_dark.png)
- **Tablet (768px):** [Light Mode](resident_768_light.png) • [Dark Mode](resident_768_dark.png)
- **Desktop (1280px):** [Light Mode](resident_1280_light.png) • [Dark Mode](resident_1280_dark.png)

**Key Highlights:**
- Maintenance Dues Hero Card with dynamic `ProgressRing` and count-up currency (`AnimatedCountUp.currency`).
- Dynamic Rotating Resident QR Gate Pass (`ResidentQrPassSheet`) with 60s rotating OTP-style HMAC token.
- Pre-approved visitor entry, recent visitor logs, notices & amenity reservation hub.

---

## 2. Security Guard Terminal
- **Mobile (375px):** [Light Mode](guard_375_light.png) • [Dark Mode](guard_375_dark.png)
- **Tablet (768px):** [Light Mode](guard_768_light.png) • [Dark Mode](guard_768_dark.png)
- **Desktop (1280px):** [Light Mode](guard_1280_light.png) • [Dark Mode](guard_1280_dark.png)

**Key Highlights:**
- Full-screen high-tech Gate Pass Scanner (`GuardPassScannerScreen`) with `mobile_scanner`, custom corner brackets, sweeping laser beam, and torch toggle.
- Tactile 4-digit manual passcode check-in fallback.
- Live occupancy counters with `AnimatedCountUp` and pulsing SOS emergency banner (`PulseDot.sos`).

---

## 3. Society Chairman / Admin
- **Mobile (375px):** [Light Mode](chairman_375_light.png) • [Dark Mode](chairman_375_dark.png)
- **Tablet (768px):** [Light Mode](chairman_768_light.png) • [Dark Mode](chairman_768_dark.png)
- **Desktop (1280px):** [Light Mode](chairman_1280_light.png) • [Dark Mode](chairman_1280_dark.png)

**Key Highlights:**
- Responsive Executive KPI Grid with `SparklineChart` collection trends and `AnimatedCountUp`.
- Interactive Expense Review Queue with swipe-to-approve (right) and swipe-to-reject (left) micro-interactions (`Dismissible` + `PressScale`).

---

## 4. Society Accountant
- **Mobile (375px):** [Light Mode](accountant_375_light.png) • [Dark Mode](accountant_375_dark.png)
- **Tablet (768px):** [Light Mode](accountant_768_light.png) • [Dark Mode](accountant_768_dark.png)
- **Desktop (1280px):** [Light Mode](accountant_1280_light.png) • [Dark Mode](accountant_1280_dark.png)

**Key Highlights:**
- Society financial balance summary with bank position and collections count-up.
- Double-entry General Ledger (JE-xxx) cards with balanced/unbalanced semantic chips and staggered entry motion (`FadeSlideIn.staggered`).
- Indian Rupee grouping (`AppCurrencyFormatter.format`) and date formatting (`AppDateTimeFormatter.formatDate`).

---

## 5. SaaS Platform Super Admin
- **Mobile (375px):** [Light Mode](saas_admin_375_light.png) • [Dark Mode](saas_admin_375_dark.png)
- **Tablet (768px):** [Light Mode](saas_admin_768_light.png) • [Dark Mode](saas_admin_768_dark.png)
- **Desktop (1280px):** [Light Mode](saas_admin_1280_light.png) • [Dark Mode](saas_admin_1280_dark.png)

**Key Highlights:**
- Multi-tenant cloud metrics grid with Monthly Recurring Revenue (MRR) sparkline trend.
- Step-by-step Onboarding Stepper modal (`OnboardSocietySheet`) with animated stage transitions (Society Details -> Subscription Tier -> Administrator Root Account).
- Customer tenant society directory and active automated billing tiers.
