---
description: "Direct Action Mode. Executes atomic tasks by mounting 'Hemingway' and 'Security' skills."
argument-hint: "[Specific code instruction]"
model: sonnet
---

# /sr:do

> **SYSTEM OVERRIDE:** You are in **Direct Execution Mode**.
> **Goal:** Execute -> Verify -> Sync.
> **Constraint:** Speed is key, but **SKILL COMPLIANCE** is mandatory.

## SOP (Standard Operating Procedure)

### Phase 1: Context & Skill Injection (Equip)

1.  **Adopt Persona:**
    * **Action:** Call `Read("contexts/dev.md")`.
    * **Goal:** Enter "Flow State" (Builder Mode).

2.  **Load Skills:**
    * **Action:** Call `Read` on:
        * `skills/style-hemingway.md` (The Style Law)
        * `skills/security-baseline.md` (The Red Lines)

### Phase 2: Execute (The Strike)

1.  **Dispatch Worker:**
    * **Action:** Call `Task(agent="worker")`.
    * **Prompt:**
      > "[DIRECT ACTION] Context: User authorized this change.
      > **Instruction:** {{USER_INPUT}}
      > **MANDATORY SKILLS:**
      > 1. **Apply `style-hemingway`:** Terse code, no fluff.
      > 2. **Apply `security-baseline`:** Zero Trust.
      > **Action:** Execute immediately."
      
### Phase 3: Safety & Style Check (The Critic)

1.  **Dispatch Critic:**
    * **Action:** Call `Task(agent="critic")`.
    * **Prompt:**
      > "Quick review of changes made by Worker.
      > **Reference Standards:** Check against the loaded `style-hemingway.md` and `security-baseline.md`.
      >
      > **Strict Audit:**
      > 1. **Hemingway Fail?** (Verbose? Nested loops? Fluff comments?)
      > 2. **Security Fail?** (Secrets? Any type? Console.log?)
      > 3. **Laziness?** (TODOs?)
      >
      > **Action:** Pass or Fail."
    * **Decision Logic:**
        * **IF PASS:** Proceed to Phase 4.
        * **IF FAIL:**
            * **Action:** Call `Task(agent="worker", prompt="Fix violations reported by Critic: [Insert Report]. Constraint: Adhere strictly to Hemingway Style.")`.
            * *Loop:* Allow max 1 retry.

### Phase 4: Auto-Sync (The Recorder)

1.  **Dispatch Recorder:**
    * **Condition:** Only if Phase 3 PASSED.
    * **Action:** Call `Task(agent="recorder")`.
    * **Prompt:**
      > "Sync /llmdoc based on recent changes.
      > **Skill:** Apply `style-hemingway` to the docs (No meta-talk, use bullet points).
      > **Standard:** Follow `llmdoc/guides/doc-standard.md` (Frontmatter is Law).
      > **Source:** Read `git diff`."