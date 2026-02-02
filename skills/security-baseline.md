---
name: security-baseline
description: Universal security constraints. Zero Trust protocol for Agents.
type: skill
id: security-baseline
---

# Skill: Security Baseline

**MANDATE:** Zero Trust. Secure by Design. Defense in Depth.
**TRIGGER:** All Code Generation (`/sr:do`, `/sr:mission`) and Review (`/sr:reviewPR`).

## 🛑 THE RED LINES (Non-Negotiable)

### 1. Secrets Management
* **Rule:** NO hardcoded secrets, API keys, or tokens.
* **Pattern:** `const key = "sk-..."` -> **BLOCK**.
* **Fix:** Use `process.env.KEY`.

### 2. Input Validation (The Firewall)
* **Rule:** NEVER trust `req.body`, `params`, or external API responses.
* **Pattern:** `const data = req.body; doSomething(data)` -> **BLOCK**.
* **Fix:** Parse with **Zod** (TS) or **Pydantic** (Python) at the edge. Fail fast.

### 3. Type Safety as Security
* **Rule:** `any` type is a security vulnerability (Blind Spot).
* **Pattern:** `function handle(input: any)` -> **BLOCK**.
* **Fix:** Define an Interface. If unknown, use `unknown` + Type Guard.

### 4. Injection Prevention
* **SQL:** NO string concatenation for queries. Use Parameterized Queries (ORM/Prepared Statements).
* **DOM:** NO `dangerouslySetInnerHTML` (React) unless sanitized (DOMPurify).
* **OS:** NO user input directly into `exec()` or `spawn()`.

### 5. Observability Hygiene
* **Rule:** NO logging of PII (Emails, Phones) or Credentials (Headers, Tokens).
* **Pattern:** `console.log(headers)` -> **BLOCK**.
* **Fix:** Log IDs or Status Codes only.

## 👮 CRITIC'S CHECKLIST (Audit Protocol)

When reviewing code, scan for these **Toxic Assets**:

| Category | Signature | Verdict |
| :--- | :--- | :--- |
| **Secrets** | `['"']sk-[a-zA-Z0-9]{20,}['"]` | 🔴 **BLOCKING** |
| **Secrets** | `['"']ey[a-zA-Z0-9]{20,}['"]` (JWT) | 🔴 **BLOCKING** |
| **Debug** | `console.log`, `debugger`, `print()` | 🟡 **WARNING** (Dev) / 🔴 **BLOCKING** (Prod) |
| **Types** | `: any`, `as any` | 🔴 **BLOCKING** |
| **Auth** | Reading `req.headers.authorization` without verification | 🔴 **BLOCKING** |
| **SQL** | `query("SELECT * FROM users WHERE id = " + id)` | 🔴 **BLOCKING** |

## 🛡️ REMEDIATION EXAMPLES

### ❌ Unsafe (Rejected)
```typescript
// Vulnerability: No validation, Any type, SQL Injection
app.post('/user', (req, res) => {
  const data: any = req.body;
  db.query("INSERT INTO users VALUES (" + data.name + ")");
});
```