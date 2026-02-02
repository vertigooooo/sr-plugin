---
name: thinking-chain
description: Structured reasoning process for complex tasks. Prevents impulsive hallucinations.
type: skill
id: thinking-chain
---

# Skill: Analytical Chain of Thought

**MANDATE:** Think twice. Act once.
**TRIGGER:** Complex requests (`/sr:what`), Strategy Formulation (`scout`), or Root Cause Analysis (`investigator`).

## 🧠 THE REASONING ENGINE

### Step 1: Deconstruct (The Break Down)
* **Input:** A complex user request (e.g., "Refactor the auth system").
* **Action:** Break it down into atomic units.
    * *Atomic Unit:* A task that can be done with 1-2 tool calls.
    * *Logic:* If a step requires >3 jumps, break it down further.

### Step 2: Dependency Mapping (The Sequence)
* **Question:** "Does Step B strictly require Step A?"
* **Logic:**
    * If **Yes**: Sequence them (Linear).
    * If **No**: Run them in parallel (Async).
* **Risk:** Identify blockers. "I cannot write the test (B) until I know the data shape (A)."

### Step 3: Constraint Check (The Safety Valve)
Before executing *any* plan, run it against the Active Laws:
1.  **Security:** Does this expose secrets? (Check `skills/security-baseline`).
2.  **Style:** Is this too verbose? (Check `skills/style-hemingway`).
3.  **Stability:** Will this break the build?

### Step 4: Execution Simulation (Pre-Flight)
* **Visualisation:** Imagine the tool output.
* **Check:** "If I run `Read('missing_file.ts')`, it will fail. Do I need to `Glob` first?"
* **Rule:** Never assume a file exists. Verify then Act.

## 🚦 TRIAGE LOGIC (For Dispatchers)

When analyzing User Intent (e.g., in `/sr:what`), apply this logic tree:

1.  **Is it Atomic?**
    * *Condition:* Affects 1 file, or is a simple query.
    * *Route:* **`/sr:do`** (The Worker).

2.  **Is it Creative/Architectural?**
    * *Condition:* Requires a plan, affects multiple files, or needs logic design.
    * *Route:* **`/sr:mission`** (The Commander).

3.  **Is it Repetitive/Batch?**
    * *Condition:* "Update all headers", "Migrate 50 files".
    * *Route:* **`/sr:campaign`** (The Swarm).

4.  **Is it External?**
    * *Condition:* GitHub, Vercel, Logs, Documentation fetch.
    * *Route:* **`/sr:connect`** (The Integrator).

## 🛑 ERROR HANDLING PROTOCOL

If a step fails (e.g., Tool Error, Test Failure):

1.  **STOP:** Do not immediately retry the exact same command.
2.  **ANALYZE:** Why did it fail?
    * *Path Error?* -> Use `Glob` to find the real path.
    * *Syntax Error?* -> Check the file content.
3.  **ADAPT:** Formulate a *new* hypothesis.
4.  **RETRY:** Execute the corrected plan.
* **Limit:** Max 3 retries. Then report failure to User.

## ✨ EXAMPLES

### ❌ Weak Thought (Impulsive)
* "User wants to fix the login. I will write the login function code now." (Skipped analysis, context, and safety).

### ✅ Strong Thought (Chain)
1.  **Deconstruct:** User reports "Login 500 Error".
2.  **Map:** I need to see logs (1) -> locate code (2) -> fix (3).
3.  **Pre-Flight:** I don't know where the logs are.
4.  **Action:** Call `vercel_get_deployment_logs` OR `Read('server.log')` first.