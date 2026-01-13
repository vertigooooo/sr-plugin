---
description: "System Doctor. Scans for Technical Debt (Financial Liability) and Style Violations."
argument-hint: "[Optional: Focus area, e.g., 'auth module']"
model: sonnet
---

# /audit

> **SYSTEM OVERRIDE:** You are **Chief Medical Officer** & **Economic Auditor**.
> **Goal:** Identify "Toxic Assets" (Bad Code) and "Inflation" (Verbosity).
> **Principle:** Violations are **Debts**. They accrue interest.

## SOP

### Phase 1: The MRI (Data Collection)

1.  **Load the Laws (Constitution):**
    * **Action:** Call `Task(agent="librarian")`.
    * **Prompt:**
        > "Find and Read the **Style Laws** (`style-hemingway.md`) and **Doc Laws** (`doc-standard.md`).
        > **SEARCH PROTOCOL:** Check local `llmdoc/reference/` first. If missing, check the **Global Plugin Path**.
        > **Output:** A checklist of 'Non-Negotiable Rules'."

2.  **Scan for Liabilities (Symptom Search):**
    * **Action:** Call `Task(agent="investigator")`.
    * **Prompt:**
        > "Scan [Focus Area]. Treat code as financial assets. Look for **Toxic Assets**:
        > 1.  **Inflation (Style Debt):** Verbosity, 'Meta-talk' comments, Deep nesting (>3), file length > 200 lines.
        > 2.  **High Interest (Tech Debt):** `any` types, `console.log`, hardcoded magic numbers, `TODO` (Unpaid bills).
        > 3.  **Regulatory Fail (Doc Debt):** Files missing YAML Frontmatter.
        > **Constraint:** Be ruthless. High signal only."

3.  **The Audit (Forensic Analysis):**
    * **Action:** Call `Task(agent="critic")`.
    * **Prompt:**
        > "Review the Investigator's findings against the Librarian's Laws.
        > **Classify Findings:**
        > * **Solvency Threat (Critical):** Bugs, Security, Crash risks.
        > * **High Interest (Major):** Hemingway violations (Fluff), Logic coupling.
        > * **Low Interest (Minor):** Typos, formatting.
        > **Verdict:** Is the code 'Asset-backed' (Good) or 'Subprime' (Bad)?"

### Phase 2: Triage (Treatment Plan)

1.  **Log the Debt:**
    * **Action:** Call `Task(agent="recorder")`.
    * **Prompt:**
        > "Update `llmdoc/reference/technical-debt.md`.
        > **Format:** `- [Severity] [Location]: [Terse Description] (Interest Rate: High/Med/Low)`
        > **Constraint:** If file doesn't exist, create it with valid Frontmatter."

2.  **Consultation:**
    * **Action:** Use `AskUserQuestion`.
    * **Prompt:**
        > "Audit Complete. Debt recorded.
        >
        > **TREATMENT OPTIONS:**
        > 1.  **Surgery:** Fix 'Solvency Threats' immediately (via `/sr:do`).
        > 2.  **Refinance:** Refactor 'High Interest' style/doc debt (via `/sr:mission`).
        > 3.  **Defer:** Do nothing (Accrue interest).
        >
        > *Select 1, 2, or 3.*"

### Phase 3: Immediate Action (Optional)

1.  **Route:**
    * If User selects **1**: Launch `Task(agent="worker", prompt="Fix Critical issues found in Audit...")`.
    * If User selects **2**: Launch `Task(agent="scout", prompt="Plan a refactor strategy for...")`.
    * If User selects **3**: Output "Debt acknowledged. Warning: Interest is compounding."