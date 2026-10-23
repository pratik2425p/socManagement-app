// =========================================================
// Admin Portal SaaS — Frontend Controller & Serverpod Client
// =========================================================

const SERVER_URL = 'http://localhost:8080';

// Global Live State
let appState = {
  societies: [],
  subscriptions: [],
  metrics: null,
  activeTab: 'add-society',
  searchQuery: '',
};

// Toast Notification System
function showToast(message, type = 'success') {
  const container = document.getElementById('toast-container');
  if (!container) return;

  const toast = document.createElement('div');
  const bgClass = type === 'success' 
    ? 'bg-slate-900 text-white border-slate-700' 
    : (type === 'error' ? 'bg-red-900 text-white border-red-700' : 'bg-indigo-900 text-white border-indigo-700');
  
  const icon = type === 'success' 
    ? '✓' 
    : (type === 'error' ? '✕' : 'ℹ');

  toast.className = `${bgClass} pointer-events-auto border px-4 py-3 rounded-xl shadow-xl text-xs font-semibold flex items-center gap-2.5 transition-all transform duration-200 translate-y-2 opacity-0 max-w-sm`;
  toast.innerHTML = `
    <span class="w-5 h-5 rounded-full bg-white/20 flex items-center justify-center font-bold text-[11px]">${icon}</span>
    <span class="flex-1">${message}</span>
  `;

  container.appendChild(toast);

  // Trigger animation
  requestAnimationFrame(() => {
    toast.classList.remove('translate-y-2', 'opacity-0');
  });

  // Auto-dismiss after 3.5s
  setTimeout(() => {
    toast.classList.add('translate-y-2', 'opacity-0');
    setTimeout(() => toast.remove(), 250);
  }, 3500);
}

// Mobile Sidebar Toggle
function toggleMobileSidebar() {
  const sidebar = document.getElementById('app-sidebar');
  const backdrop = document.getElementById('mobile-backdrop');
  if (!sidebar || !backdrop) return;

  const isHidden = sidebar.classList.contains('-translate-x-full');
  if (isHidden) {
    sidebar.classList.remove('-translate-x-full');
    backdrop.classList.remove('hidden');
  } else {
    sidebar.classList.add('-translate-x-full');
    backdrop.classList.add('hidden');
  }
}

// Initialize on DOM Ready
document.addEventListener('DOMContentLoaded', () => {
  updateLivePreview();
  fetchInitialData();
});

// Tab Switcher
function switchTab(tabId) {
  appState.activeTab = tabId;

  // Close mobile sidebar if open
  const sidebar = document.getElementById('app-sidebar');
  const backdrop = document.getElementById('mobile-backdrop');
  if (sidebar && backdrop && !backdrop.classList.contains('hidden')) {
    sidebar.classList.add('-translate-x-full');
    backdrop.classList.add('hidden');
  }

  // Update nav button styles
  const navTabs = ['dashboard', 'add-society', 'societies', 'admins', 'subscriptions'];
  navTabs.forEach(t => {
    const btn = document.getElementById(`nav-${t}`);
    const view = document.getElementById(`view-${t}`);
    
    if (btn) {
      if (t === tabId) {
        btn.className = 'nav-item w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-sm font-semibold bg-brand-600 text-white shadow-md shadow-brand-600/30 transition-all';
      } else {
        btn.className = 'nav-item w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-sm font-medium hover:bg-slate-800 hover:text-white transition-all text-slate-400';
      }
    }

    if (view) {
      if (t === tabId) {
        view.classList.remove('hidden');
      } else {
        view.classList.add('hidden');
      }
    }
  });

  // Update header title
  const topTitle = document.getElementById('top-title');
  if (topTitle) {
    switch (tabId) {
      case 'add-society':
        topTitle.textContent = 'Add New Society & Assign Admin';
        break;
      case 'societies':
        topTitle.textContent = 'Registered Housing Societies Directory';
        break;
      case 'dashboard':
        topTitle.textContent = 'Multi-Tenant SaaS Overview';
        break;
      case 'admins':
        topTitle.textContent = 'Primary Society Administrators';
        break;
      case 'subscriptions':
        topTitle.textContent = 'Customer Subscriptions & Licensing';
        break;
    }
  }

  if (tabId === 'societies') renderSocietiesList();
  if (tabId === 'dashboard') renderDashboard();
  if (tabId === 'admins') renderAdminsList();
  if (tabId === 'subscriptions') renderSubscriptionsList();
}

// Fetch Initial Data from Serverpod API
async function fetchInitialData() {
  try {
    // 1. Fetch Societies
    const socRes = await fetch(`${SERVER_URL}/society`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ method: 'getSocieties' }),
    });
    if (socRes.ok) {
      appState.societies = await socRes.json();
    }

    // 2. Fetch Subscriptions
    const subRes = await fetch(`${SERVER_URL}/saasAdmin`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ method: 'getAllSubscriptions' }),
    });
    if (subRes.ok) {
      appState.subscriptions = await subRes.json();
    }

    // 3. Fetch Metrics
    const metricRes = await fetch(`${SERVER_URL}/saasAdmin`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ method: 'getMetricSummary' }),
    });
    if (metricRes.ok) {
      appState.metrics = await metricRes.json();
    }

    // Update UI counters
    const badge = document.getElementById('badge-total-societies');
    if (badge) badge.textContent = appState.societies.length;

    renderDashboard();
    renderSocietiesList();
  } catch (err) {
    console.warn('Serverpod backend connection error:', err);
    showToast('Notice: Could not connect to Serverpod backend on :8080', 'error');
  }
}

function refreshData() {
  fetchInitialData();
  showToast('Live database records refreshed.');
}

// Live Dynamic Preview in Add Society Form
function updateLivePreview() {
  const regNumber = document.getElementById('regNumber')?.value.trim();
  const societyName = document.getElementById('societyName')?.value.trim();
  const societyCode = document.getElementById('societyCode')?.value.trim();
  const totalFlats = document.getElementById('totalFlats')?.value.trim();
  const address = document.getElementById('address')?.value.trim();
  const city = document.getElementById('city')?.value.trim();
  const pincode = document.getElementById('pincode')?.value.trim();

  const planTierEl = document.querySelector('input[name="planTier"]:checked');
  const planTier = planTierEl ? planTierEl.value : 'pro';

  const adminName = document.getElementById('adminName')?.value.trim();
  const adminPhone = document.getElementById('adminPhone')?.value.trim();
  const adminFlat = document.getElementById('adminFlat')?.value.trim();
  const adminRoleEl = document.getElementById('adminRole');
  const adminRole = adminRoleEl ? adminRoleEl.options[adminRoleEl.selectedIndex].text : 'Chairman';

  // Update Preview Elements
  const previewReg = document.getElementById('preview-reg');
  if (previewReg) previewReg.textContent = regNumber ? `REG: ${regNumber.toUpperCase()}` : 'REG: PENDING';

  const previewName = document.getElementById('preview-name');
  if (previewName) previewName.textContent = societyName || 'New Society Name (Pending)';

  const previewLocation = document.getElementById('preview-location');
  if (previewLocation) {
    if (address || city) {
      previewLocation.textContent = `${address || ''}${address && city ? ', ' : ''}${city || ''}${pincode ? ' - ' + pincode : ''}`;
    } else {
      previewLocation.textContent = 'Address & City Pending';
    }
  }

  const previewCode = document.getElementById('preview-code');
  if (previewCode) previewCode.textContent = societyCode ? societyCode.toUpperCase() : (regNumber ? regNumber.toUpperCase() : 'CODE');

  const previewFlats = document.getElementById('preview-flats');
  if (previewFlats) previewFlats.textContent = totalFlats ? `${totalFlats} Flats` : '-- Flats';

  const previewPlan = document.getElementById('preview-plan');
  if (previewPlan) previewPlan.textContent = `${planTier.toUpperCase()} PLAN`;

  const previewAdminName = document.getElementById('preview-admin-name');
  if (previewAdminName) previewAdminName.textContent = adminName || 'Society Admin Name (Pending)';

  const previewAdminPhone = document.getElementById('preview-admin-phone');
  if (previewAdminPhone) previewAdminPhone.textContent = adminPhone ? `📱 ${adminPhone}` : '📱 Mobile Number';

  const previewAdminFlat = document.getElementById('preview-admin-flat');
  if (previewAdminFlat) previewAdminFlat.textContent = adminFlat ? `Flat ${adminFlat.toUpperCase()}` : 'Flat Unit Pending';

  const previewAdminRole = document.getElementById('preview-admin-role');
  if (previewAdminRole) previewAdminRole.textContent = adminRole;

  const previewRev = document.getElementById('preview-revenue');
  if (previewRev) {
    const rate = planTier === 'starter' ? 2500 : (planTier === 'enterprise' ? 12000 : 5000);
    previewRev.textContent = `₹${rate.toLocaleString('en-IN')} / month`;
  }
}

// Handle Form Submission (Add New Society with Registration Number & Society Admin)
async function handleOnboardSubmit(e) {
  e.preventDefault();
  const btn = document.getElementById('btn-submit');
  const originalText = btn.innerHTML;
  btn.disabled = true;
  btn.innerHTML = `
    <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white inline-block" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
    </svg>
    Connecting to PostgreSQL via Serverpod...
  `;

  const regNumber = document.getElementById('regNumber').value.trim();
  const societyName = document.getElementById('societyName').value.trim();
  const societyCode = document.getElementById('societyCode').value.trim() || regNumber;
  const totalFlats = parseInt(document.getElementById('totalFlats').value.trim(), 10) || 50;
  const address = document.getElementById('address').value.trim();
  const city = document.getElementById('city').value.trim();
  const pincode = document.getElementById('pincode').value.trim();

  const planTier = document.querySelector('input[name="planTier"]:checked')?.value || 'pro';
  const adminName = document.getElementById('adminName').value.trim();
  const adminPhone = document.getElementById('adminPhone').value.trim();
  const adminEmail = document.getElementById('adminEmail').value.trim();
  const adminFlat = document.getElementById('adminFlat')?.value.trim() || 'A-101';

  const formattedAdminEmail = adminFlat ? `${adminEmail}#${adminFlat}` : adminEmail;

  const payload = {
    method: 'onboardNewSocietyWithAdmin',
    society: {
      name: societyName,
      code: regNumber.toUpperCase(), // Store Registration Number in code
      address: address,
      city: city,
      state: 'Maharashtra',
      pincode: pincode,
      totalFlats: totalFlats,
      subscriptionPlan: planTier,
      subscriptionStatus: 'active',
      createdAt: new Date().toISOString(),
    },
    adminName: adminName,
    adminPhone: adminPhone,
    adminEmail: formattedAdminEmail,
    planName: planTier,
  };

  try {
    const res = await fetch(`${SERVER_URL}/society`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });

    if (res.ok) {
      const created = await res.json();
      
      // Update modal info
      document.getElementById('modal-society-name').textContent = created.name;
      document.getElementById('modal-reg-no').textContent = regNumber.toUpperCase();
      document.getElementById('modal-admin-name').textContent = adminName;
      document.getElementById('modal-admin-phone').textContent = adminPhone;
      const modalFlatEl = document.getElementById('modal-admin-flat');
      if (modalFlatEl) modalFlatEl.textContent = `Flat ${adminFlat.toUpperCase()}`;
      document.getElementById('modal-plan').textContent = `${planTier.toUpperCase()} PLAN`;

      // Open success modal
      document.getElementById('success-modal').classList.remove('hidden');

      showToast(`Society "${created.name}" onboarded successfully!`);

      // Refresh live records
      await fetchInitialData();

      // Reset form
      document.getElementById('onboard-form').reset();
      updateLivePreview();
    } else {
      const errText = await res.text();
      showToast(`Serverpod Error (${res.status}): ${errText}`, 'error');
    }
  } catch (err) {
    showToast(`Network Error: Ensure Serverpod is active on http://localhost:8080`, 'error');
  } finally {
    btn.disabled = false;
    btn.innerHTML = originalText;
  }
}

function closeSuccessModal(goToDirectory) {
  document.getElementById('success-modal').classList.add('hidden');
  if (goToDirectory) {
    switchTab('societies');
  }
}

// Copy Text Helper
function copyText(text, label = 'Text') {
  navigator.clipboard.writeText(text).then(() => {
    showToast(`Copied ${label} to clipboard!`);
  }).catch(() => {
    showToast(`Failed to copy to clipboard`, 'error');
  });
}

// Render Societies Directory
function renderSocietiesList() {
  const container = document.getElementById('societies-list');
  if (!container) return;

  const query = appState.searchQuery.toLowerCase();
  const filtered = appState.societies.filter(s => {
    const nameMatch = (s.name || '').toLowerCase().includes(query);
    const codeMatch = (s.code || '').toLowerCase().includes(query);
    const cityMatch = (s.city || '').toLowerCase().includes(query);
    const planMatch = (s.subscriptionPlan || '').toLowerCase().includes(query);
    return nameMatch || codeMatch || cityMatch || planMatch;
  });

  if (filtered.length === 0) {
    container.innerHTML = `
      <div class="col-span-full text-center py-12 bg-white rounded-2xl border border-slate-200">
        <p class="text-slate-500 text-sm">No housing societies found matching "${appState.searchQuery}".</p>
        <button onclick="switchTab('add-society')" class="mt-3 px-4 py-2 bg-brand-600 text-white rounded-xl text-xs font-bold shadow-sm">
          + Add New Society
        </button>
      </div>
    `;
    return;
  }

  container.innerHTML = filtered.map(s => {
    const isPro = (s.subscriptionPlan || '').toLowerCase().includes('pro');
    const isEnt = (s.subscriptionPlan || '').toLowerCase().includes('enterprise');
    const planBadge = isEnt 
      ? '<span class="bg-purple-100 text-purple-800 text-[10px] font-extrabold px-2 py-0.5 rounded">ENTERPRISE</span>'
      : isPro 
        ? '<span class="bg-indigo-100 text-indigo-800 text-[10px] font-extrabold px-2 py-0.5 rounded">PRO PLAN</span>'
        : '<span class="bg-emerald-100 text-emerald-800 text-[10px] font-extrabold px-2 py-0.5 rounded">STARTER</span>';

    // Find linked subscription contact if available
    const linkedSub = appState.subscriptions.find(sub => sub.societyId === s.id);
    const adminContact = linkedSub?.contactPhone ? `📱 ${linkedSub.contactPhone}` : 'Admin Appointed';

    return `
      <div class="bg-white rounded-2xl border border-slate-200/90 p-5 shadow-sm hover:shadow-md transition-all flex flex-col justify-between">
        <div class="space-y-3">
          <div class="flex items-center justify-between gap-2">
            <span class="font-mono-code text-[11px] font-bold bg-slate-100 text-slate-800 px-2 py-0.5 rounded border border-slate-200 truncate max-w-[170px]" title="${s.code || 'N/A'}">
              REG: ${s.code || 'N/A'}
            </span>
            ${planBadge}
          </div>

          <div>
            <h3 class="font-bold text-base text-slate-900 leading-snug line-clamp-1" title="${s.name}">${s.name}</h3>
            <p class="text-xs text-slate-500 mt-0.5 line-clamp-1" title="${s.address}, ${s.city} - ${s.pincode}">${s.address}, ${s.city} - ${s.pincode}</p>
          </div>

          <div class="grid grid-cols-2 gap-2 pt-2 border-t border-slate-100 text-xs">
            <div>
              <span class="text-slate-400 block text-[10px] font-semibold uppercase">Total Capacity</span>
              <span class="font-bold text-slate-800">${s.totalFlats} Flats</span>
            </div>
            <div>
              <span class="text-slate-400 block text-[10px] font-semibold uppercase">Admin Contact</span>
              <span class="font-semibold text-slate-700 font-mono-code text-[11px] truncate block">${adminContact}</span>
            </div>
          </div>
        </div>

        <div class="pt-3.5 mt-3 border-t border-slate-100 flex items-center justify-between gap-2">
          <span class="text-[11px] text-slate-400 font-mono-code">ID #${s.id}</span>
          <div class="flex gap-1.5">
            <button onclick="copyText('${s.code || ''}', 'Registration Number')" class="px-2.5 py-1 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-lg text-xs font-semibold transition-all">
              Copy Reg
            </button>
            <button onclick="copyText('Mobile Login Instructions for ${s.name}: Open Mobile App and enter registered phone: ${linkedSub?.contactPhone || 'Registered Mobile'}', 'Admin Login Details')" class="px-2.5 py-1 bg-indigo-50 hover:bg-indigo-100 text-indigo-700 rounded-lg text-xs font-semibold transition-all">
              Copy Login Info
            </button>
          </div>
        </div>
      </div>
    `;
  }).join('');
}

function filterSocieties() {
  const input = document.getElementById('search-input');
  if (input) {
    appState.searchQuery = input.value.trim();
    renderSocietiesList();
  }
}

// Render Dashboard Overview
function renderDashboard() {
  const m = appState.metrics;
  const kpiSoc = document.getElementById('kpi-societies');
  const kpiFlats = document.getElementById('kpi-flats');
  const kpiMrr = document.getElementById('kpi-mrr');

  if (kpiSoc) kpiSoc.textContent = appState.societies.length;
  if (kpiFlats) {
    const totalFlats = appState.societies.reduce((acc, s) => acc + (s.totalFlats || 0), 0);
    kpiFlats.textContent = totalFlats;
  }
  if (kpiMrr && m) {
    kpiMrr.textContent = `₹${Math.round(m.monthlyRecurringRevenue).toLocaleString('en-IN')}`;
  }

  // Dashboard Recent Societies
  const recentContainer = document.getElementById('dashboard-recent-societies');
  if (recentContainer) {
    if (appState.societies.length === 0) {
      recentContainer.innerHTML = '<p class="text-xs text-slate-500 py-3">No client societies registered yet.</p>';
    } else {
      recentContainer.innerHTML = appState.societies.slice(0, 5).map(s => `
        <div class="flex items-center justify-between p-3 rounded-xl bg-slate-50 hover:bg-slate-100/80 transition-all border border-slate-100">
          <div class="min-w-0 pr-3">
            <h4 class="font-bold text-xs sm:text-sm text-slate-900 truncate">${s.name}</h4>
            <p class="text-[11px] text-slate-500 truncate">Reg: <span class="font-mono-code font-semibold">${s.code || 'N/A'}</span> • ${s.city} • ${s.totalFlats} Flats</p>
          </div>
          <span class="text-xs px-2.5 py-1 rounded-full bg-emerald-50 text-emerald-700 font-bold border border-emerald-200 flex-shrink-0 uppercase text-[10px]">
            ${s.subscriptionPlan || 'Active'}
          </span>
        </div>
      `).join('');
    }
  }
}

// Render Society Admins List
function renderAdminsList() {
  const container = document.getElementById('admins-list');
  if (!container) return;

  if (appState.societies.length === 0) {
    container.innerHTML = `
      <div class="col-span-full text-center py-12 bg-white rounded-2xl border border-slate-200">
        <p class="text-slate-500 text-sm">No administrators appointed yet. Onboard a society to appoint its primary admin.</p>
        <button onclick="switchTab('add-society')" class="mt-3 px-4 py-2 bg-brand-600 text-white rounded-xl text-xs font-bold shadow-sm">
          + Add New Society
        </button>
      </div>
    `;
    return;
  }

  container.innerHTML = appState.societies.map(s => {
    const linkedSub = appState.subscriptions.find(sub => sub.societyId === s.id);
    const phone = linkedSub?.contactPhone || 'Registered Mobile';
    const email = linkedSub?.contactEmail || 'office@society.com';

    return `
      <div class="bg-white rounded-2xl border border-slate-200/90 p-5 shadow-sm flex flex-col justify-between">
        <div class="space-y-3">
          <div class="flex items-start gap-3">
            <div class="w-10 h-10 rounded-xl bg-indigo-100 text-indigo-700 flex items-center justify-center font-bold text-base flex-shrink-0">
              🏛️
            </div>
            <div class="flex-1 min-w-0">
              <h4 class="font-bold text-sm text-slate-900 truncate">Primary Society Administrator</h4>
              <p class="text-xs text-brand-600 font-semibold truncate mt-0.5">${s.name}</p>
              <p class="text-[11px] text-slate-500 font-mono-code mt-0.5">REG: ${s.code || 'N/A'}</p>
            </div>
          </div>

          <div class="bg-slate-50 p-3 rounded-xl border border-slate-100 space-y-1.5 text-xs">
            <div class="flex items-center justify-between">
              <span class="text-slate-500">Designation:</span>
              <span class="font-bold text-slate-900">Chairman</span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-slate-500">Mobile Login:</span>
              <span class="font-mono-code font-bold text-indigo-700">${phone}</span>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-slate-500">Contact Email:</span>
              <span class="text-slate-700 truncate max-w-[180px]">${email}</span>
            </div>
          </div>
        </div>

        <div class="pt-3 mt-3 border-t border-slate-100 flex items-center justify-between">
          <span class="inline-flex items-center gap-1 text-[11px] font-semibold text-emerald-600">
            <span class="w-1.5 h-1.5 rounded-full bg-emerald-500"></span> Mobile Access Active
          </span>
          <button onclick="copyText('${phone}', 'Admin Phone Number')" class="px-2.5 py-1 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-lg text-xs font-semibold transition-all">
            Copy Phone
          </button>
        </div>
      </div>
    `;
  }).join('');
}

// Render Subscriptions List
function renderSubscriptionsList() {
  const container = document.getElementById('subscriptions-list');
  if (!container) return;

  if (appState.subscriptions.length === 0) {
    container.innerHTML = `
      <div class="text-center py-12 bg-white rounded-2xl border border-slate-200">
        <p class="text-slate-500 text-sm">No active customer subscriptions in database.</p>
        <button onclick="switchTab('add-society')" class="mt-3 px-4 py-2 bg-brand-600 text-white rounded-xl text-xs font-bold shadow-sm">
          + Onboard First Society
        </button>
      </div>
    `;
    return;
  }

  container.innerHTML = appState.subscriptions.map(sub => `
    <div class="bg-white rounded-2xl border border-slate-200/90 p-4 sm:p-5 shadow-sm flex flex-col sm:flex-row sm:items-center justify-between gap-4">
      <div class="space-y-1 min-w-0">
        <div class="flex items-center gap-2">
          <h4 class="font-bold text-sm sm:text-base text-slate-900 truncate">${sub.societyName}</h4>
          <span class="bg-indigo-50 text-indigo-700 text-[10px] font-extrabold px-2 py-0.5 rounded border border-indigo-200 uppercase">${sub.tier}</span>
        </div>
        <p class="text-xs text-slate-500">
          Capacity: <span class="font-bold text-slate-700">${sub.flatCount} Units</span> • Rate: <span class="font-bold text-slate-700">₹${sub.ratePerFlat}/unit</span> • Contact: <span class="font-mono-code">${sub.contactPhone || 'N/A'}</span>
        </p>
      </div>
      <div class="flex sm:flex-col items-center sm:items-end justify-between sm:justify-center border-t sm:border-t-0 pt-2 sm:pt-0 border-slate-100">
        <span class="text-base sm:text-lg font-extrabold text-emerald-600">₹${Math.round(sub.monthlyTotal).toLocaleString('en-IN')}</span>
        <span class="text-[11px] text-slate-400">Recurring / Month</span>
      </div>
    </div>
  `).join('');
}