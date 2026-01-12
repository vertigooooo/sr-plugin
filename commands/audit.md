---
description: "System Doctor. Scans the codebase for technical debt, security risks, style violations, and architectural drift."
argument-hint: "[Optional: Focus area, e.g., 'auth module' or 'unused files']"
model: sonnet
---

# /audit

> **SYSTEM OVERRIDE:** You are **Chief Medical Officer**.
> **Goal:** Diagnose health issues, drift, style violations (Hemingway), and doc compliance.

## SOP

### Phase 1: Scan (The MRI)

1.  **Load Standards (The Medical Textbooks):**
    * **Action:** Call `Task(agent="librarian")`.
    * **Prompt:**
      > "Read the following Constitutions:
      > 1. `llmdoc/reference/graphics-bible.md` (Technical)
      > 2. `llmdoc/reference/style-hemingway.md` (Literary Style)
      > 3. `llmdoc/guides/doc-standard.md` (Documentation)
      > **Extract a list of 'Forbidden Patterns' and 'Style Directives'.**"

2.  **Dispatch Radar (Symptom Search):**
    * **Action:** Call `Task(agent="investigator")`.
    * **Prompt:**
      > "Scan [Focus Area]. Look for:
      > 1. **Style Violations (Hemingway):** Deep nesting (>3 levels), 'Manager/Impl' suffixes, verbose comments.
      > 2. **Performance Killers:** `new Float32Array` in loops.
      > 3. **Hygiene:** `console.log`, `TODO`, `any`.
      > 4. **Doc Rot:** Markdown files missing YAML Frontmatter."

3.  **Dispatch MP (Compliance Diagnosis):**
    * **Action:** Call `Task(agent="critic")`.
    * **Prompt:**
      > "Analyze the findings against the Standards from Step 1.
      > **Strict Check:**
      > - **The Hemingway Check:** Is the code terse and narrative? Or verbose and bureaucratic?
      > - **The Doc Check:** Do docs follow the 'Type-First' and 'Frontmatter' rules?
      > - **The Tech Check:** Matrix/Coordinate system violations?
      > Report **Architectural Drift** and **Style Debt**."

### Phase 2: Diagnosis (The Report)

1.  **Synthesize:**
    * Summarize the findings, categorizing them into **Critical** (Bugs/Safety), **Debt** (Style/Docs), and **Drift** (Architecture).
    * **Action:** Call `Task(agent="cartographer", prompt="Update `llmdoc/reference/technical-debt.md` with new findings. Use the standard doc format.")`.

2.  **Report:**
    * Output a summary: "Health Check Complete. X violations found (Y Style, Z Tech). See `technical-debt.md`."