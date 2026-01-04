# <code>PayFlow</code> | A Peer-to-Peer Payment Engine

**PayFlow** is a full-stack financial technology demonstration that simulates a Peer-to-Peer (P2P) payment ecosystem. This project focuses on the complexities of digital ledgers, secure transaction handling, and third-party payment gateway integration using **Stripe Connect** and **Plaid**.

> **Note:** This is a portfolio project. It operates entirely within **Sandbox/Test environments**. No real currency is processed.

---

## 🚀 Core Features

* **Bank Authentication:** Securely link "bank accounts" using the Plaid Link API.
* **Virtual Ledger:** A robust PostgreSQL backend to manage user balances with ACID compliance.
* **P2P Transfers:** Real-time simulated payments between users using Stripe Connect.
* **Transaction Security:** Implementation of **Idempotency Keys** to prevent accidental double-charging.
* **Social Feed:** A global and private activity feed for transactions with social comments/emojis.
* **Instant Search:** Debounced user search to find peers by @username or email.

---

## 🛠 Tech Stack

* **Frontend:** React.js, Tailwind CSS, Socket.io-client
* **Backend:** Node.js (Express), Socket.io
* **Database:** PostgreSQL (for relational integrity)
* **Payments:** Stripe API (Connect & Treasury)
* **Banking:** Plaid API
* **Auth:** Clerk or Firebase Auth

---

## 🏗 System Architecture

The app follows a **Gateway-to-Ledger** pattern:

1. **Client** requests a payment.
2. **Server** validates the sender's virtual balance.
3. **Stripe** processes the transaction in "Test Mode."
4. **Webhooks** notify the server of success.
5. **Database** atomically updates both the Sender and Receiver records.
6. **Transactional Channel (REST) API** Handles sensitive operations like user authentication, bank linking (Plaid), and payment processing (Stripe). This ensures ACID compliance and easy error handling.
7. **Social Channel (WebSockets)** Uses Socket.io to broadcast real-time events. When a transaction is confirmed, the server pushes the event to the "Public Feed," allowing users to see updates instantly without page refreshes.
---

## 🚦 Getting Started (Development)

### Prerequisites

* [Stripe Developer Account](https://stripe.com/)
* [Plaid Developer Account](https://plaid.com/)
* Node.js (v18+)

### Installation

1. **Clone the repo:**

bash
git clone https://github.com/frontend720/PayFlow.git


2. **Install Dependencies:**
bash
npm install



3. **Environment Setup:**
Create a `.env` file and add your sandbox keys:
env
STRIPE_SECRET_KEY=sk_test_...
PLAID_CLIENT_ID=...
DATABASE_URL=...


4. **Run the App:**
bash

npm run dev

---

## 🔒 Security Measures

* **Webhooks:** All balance updates are triggered by verified Stripe Webhooks to ensure data consistency.
* **Atomic Transactions:** All database updates use SQL transactions to ensure that if a transfer fails, the ledger rolls back.
* **Data Masking:** Sensitive banking info is never stored locally; it is handled entirely by Plaid/Stripe.

---

## 📸 Roadmap

* [ ] Initial Database Schema Design
* [ ] Integration with Plaid Sandbox
* [ ] P2P Transfer Logic with Stripe Connect
* [ ] Push Notifications for received payments
* [ ] Real-time Chat/Comments on transactions
