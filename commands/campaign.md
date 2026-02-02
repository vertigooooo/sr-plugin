---
description: "Swarm Mode. Executes batched parallel missions for maximum speed."
argument-hint: "[Multi-objective goal, e.g., 'Create 5 demos']"
model: sonnet
---

# /campaign

> **SYSTEM OVERRIDE:** You are **Swarm Commander**.
> **Goal:** High-Throughput Execution.
> **Strategy:** Parallel Recon -> Unified Strategy -> **Parallel Strike**.

## SOP (Standard Operating Procedure)

### Phase 1: Context & Skill Setup (The War Room)

1.  **Load Commander Capabilities:**
    * **Action:** Call `Read` on:
        * `contexts/plan.md` (Adopt Architect Persona)
        * `skills/style-hemingway.md` (Load Style Law)
    * **Think:** "I am the Architect. I must decompose this request into independent, non-blocking execution blocks."

### Phase 2: Battle Planning (Deconstruction)

1.  **Analyze & Group:**
    * Break request into **Atomic Tasks**.
    * Ask User: "Commander, identified [N] atomic tasks. Proceed?"

### Phase 3: Saturation Reconnaissance (The Swarm)

1.  **Deploy Recon Grid:**
    * **Action:** Launch multiple agents concurrently via `Task`.
    * **Execution:**
        * `Task(agent="investigator", prompt="[Task 1] Locate files & Context...")`
        * `Task(agent="investigator", prompt="[Task 2] Locate files & Context...")`
        * ...
        * **Constitution Check:** `Task(agent="librarian", prompt="Scan `llmdoc/reference/` for Project-Specific Tech Rules (e.g. Graphics/DB Schemas). Note: We already have `style-hemingway` loaded.")`

### Phase 4: Grand Strategy (The Modular Blueprint)

1.  **Synthesize:**
    * **Action:** Call `Task(agent="scout")`.
    * **Prompt:**
      > "Review the Recon Map. Write a **Modular Campaign Strategy** at `llmdoc/agent/strategy-campaign.md`.
      > **Context:** `Read('contexts/plan.md')` (Architect Mode).
      >
      > **CRITICAL FORMAT:**
      > Divide the plan into **Independent Execution Blocks** (Block A, Block B...).
      > Ensure blocks do not touch the same files (avoid merge conflicts)."

### Phase 5: Gatekeeper (Mode Selection)

1.  **Seek Approval:**
    * **Action:** Read `strategy-campaign.md`.
    * **Present:**
        > "Strategy ready.
        > **Choose Mode:**
        > - **[P] Parallel Swarm:** Execute disjoint tasks simultaneously (Fastest).
        > - **[S] Sequential:** Execute one by one (Safest).
        > - **[T] TDD Mode:** Robust sequential execution.
        > - **[N] Abort.**"

### Phase 6: Saturation Strike (The Wolf Pack)

1.  **Execute (Dynamic Dispatch):**
    * **IF [P] Parallel Mode:**
        * **Action:** Launch multiple Worker agents **AT THE SAME TIME**.
        * **Prompt Template:**
          > "Execute BLOCK [X].
          > **Setup:** `Read('contexts/dev.md')` AND `Read('skills/style-hemingway.md')` AND `Read('skills/security-baseline.md')`.
          > **Constraint:** Apply **Hemingway Style** (Terse). Zero Trust Security."
        * *Launch Workers for Block A, B, C...*

    * **IF [S] or [T] Mode:**
        * **Action:** Launch Worker sequentially using the same Prompt Template.

2.  **Mass Review (The Audit):**
    * **Action:** Call `Task(agent="critic")`.
    * **Prompt:**
      > "Review ALL modified files.
      > **Context:** `Read('contexts/audit.md')` (Auditor Mode).
      > **Standards:** Check against `skills/style-hemingway.md` and `skills/security-baseline.md`.
      > **Verdict:** Pass or Fail?"
    * **Loop:** If Fail -> Batch Fix -> Retry.

### Phase 7: Consolidated Archival (The Debrief)

1.  **Sync Docs:**
    * **Action:** `Task(agent="recorder", prompt="Update docs. **Skill:** Load `skills/style-hemingway.md` (Terse). **Standard:** `llmdoc/guides/doc-standard.md`.")`

2.  **Continuous Learning:**
    * **Action:** `Task(agent="recorder", prompt="**Skill:** Load `skills/continuous-learning.md`. Did we discover a new universal pattern in this campaign? If yes, append to `llmdoc/reference/lessons-learned.md`.")`