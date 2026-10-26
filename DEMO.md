# SocietyOS – Interactive Offline Demo Mode

SocietyOS features a fully self-contained **Demo Mode** allowing complete end-to-end evaluation and walkthrough of all 5 personas **without requiring a deployed Serverpod backend or live payment gateway accounts**.

---

## 🚀 One-Line Run Commands

### 1. Web (Google Chrome)
```bash
cd society_flutter && flutter run -d chrome --dart-define=DEMO_MODE=true --dart-define=PAYMENT_MODE=demo
```

### 2. macOS Desktop
```bash
cd society_flutter && flutter run -d macos --dart-define=DEMO_MODE=true --dart-define=PAYMENT_MODE=demo
```

### 3. Android Device or Emulator
```bash
cd society_flutter && flutter run -d <device_id> --dart-define=DEMO_MODE=true --dart-define=PAYMENT_MODE=demo
```

*(To run against your live Serverpod backend instead, simply omit the `--dart-define` flags or pass `DEMO_MODE=false`).*

---

## 👥 Demo Personas & Pre-Seeded Profiles

| Persona | Name | Flat / Unit | Phone | Key Features to Test |
| :--- | :--- | :--- | :--- | :--- |
| **Resident** | Aarav Mehta | Flat A-101 | `9820011111` | Dues payment, Gate-Bell approval modal, Amenity slot booking, Tenancy NOC request, Emergency SOS trigger |
| **Security Guard** | Bahadur Singh | Gatehouse 1 | `9820022222` | Walk-in visitor entry, Passcode verification terminal, Real-time Emergency SOS siren monitor & acknowledgement |
| **Chairman** | Vikram Patel | Flat A-501 | `9820033333` | Society financial KPIs, Expense voucher approval queue, Broadcast notice creator, Setup wizard |
| **Accountant** | Sneha Deshmukh | Flat B-202 | `9820044444` | Double-entry general ledger, Voucher ledger execution (debits = credits), Account balances |
| **SaaS Super Admin** | Platform Admin | Platform | `9820055555` | Multi-society subscriptions, MRR & ARR metric metrics, Tenant provisioning stepper |

*Note: In Demo Mode, you can tap the floating **`DEMO`** badge in the top-right header at any time to switch between any of these 5 personas instantly.*

---

## 💳 Simulated Payment Gateway (Demo Gateway)

When paying maintenance dues in Demo Mode:
1. Tap **"Pay Now"** on any due maintenance bill.
2. The realistic checkout sheet opens with tabs for **UPI (GPay / PhonePe / Paytm)**, **Cards**, and **NetBanking**.
3. Use the **Simulation Selector** pill bar to test all possible outcomes:
   - **Success**: Simulates instant authorization, transitions bill to *PAID*, posts balanced debit/credit entries to the ledger, and generates a downloadable/shareable PDF tax receipt.
   - **Failure**: Simulates bank authentication timeout with retry shaker.
   - **Pending**: Simulates payment processing confirmation queue.
   - **Cancel**: Simulates user dismissal.

---

## 🔔 Real-Time Event Simulation

Even without a live WebSocket server, Demo Mode supports real-time streams:
- Tap the **`DEMO`** badge in the AppBar and click **"Simulate Visitor"**:
  - Immediately pushes a `GateBellEvent` on Flat A-101's channel.
  - The resident **Gate Bell Modal** slides up in real-time with 1-tap **Approve** / **Deny** buttons.
- Tap **"Simulate SOS"**:
  - Immediately sounds the full-screen audio-visual emergency alert dialog.

---

## 🛡️ Production Safety Guarantee

- `DemoDataSource` and `DemoGateway` are strictly gated by `assert(!kReleaseMode)` and throw a fatal `StateError` if ever referenced in release builds.
- The `--dart-define=DEMO_MODE` flag is guarded by `!kReleaseMode && bool.fromEnvironment('DEMO_MODE')`.
- Demo transactions never make network calls to real banking APIs or Serverpod endpoints.
