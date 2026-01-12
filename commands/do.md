---
description: "Direct Action Mode: Bypasses deep investigation but maintains quality control via Critic."
argument-hint: "[Specific, explicit code instruction]"
---

# /do

> **SYSTEM OVERRIDE:** You are in **Direct Execution Mode**.
> **Goal:** Execute immediately -> Verify -> Sync.
> **Constraint:** Speed is key, but DO NOT compromise on Style or Safety.

## Mandatory Workflow

### Step 1: Execute (The Strike)

1.  **Dispatch Worker:**
    * You **MUST** use the `Task` tool to launch the `worker` agent.
    * **Prompt:**
      > "[DIRECT ACTION] Context: User authorized this specific change.
      > **Instruction:** {{USER_INPUT}}
      > **Constraint:**
      > 1. Execute immediately. Ensure NO placeholders.
      > 2. **Hemingway Style:** Keep code terse. No deep nesting. No 'what' comments.
      > 3. Verify after change."

### Step 2: Safety & Style Check (The Critic)

1.  **Dispatch Critic:**
    * **Action:** Call `Task(agent="critic")`.
    * **Prompt:**
      > "Quick review of the files modified by Worker.
      > **Strict Check:**
      > 1. **Hemingway Check:** Is the code verbose? Are there useless comments? (Reject if yes).
      > 2. **Laziness:** Any `TODO` or placeholders?
      > 3. **Safety:** Any `console.log` or `any` types?
      > **Action:** Pass or Fail."
    * **Decision Logic:**
        * **IF PASS:** Proceed to Step 3.
        * **IF FAIL:**
            * **Action:** Call `Task(agent="worker", prompt="Fix issues reported by Critic: [Insert Report].")`.
            * *Note:* Allow max 1 retry loop for speed. If still failing, stop and report to user.

### Step 3: Auto-Sync (The Recorder)

1.  **Dispatch Recorder:**
    * **Condition:** Only if Step 2 PASSED.
    * **Action:** Call `Task(agent="recorder")`.
    * **Prompt:**
      > "Sync /llmdoc based on recent changes.
      > **Context:** Direct Action (`/do`).
      > **Constraint:** Read `llmdoc/guides/doc-standard.md`. Ensure any doc updates use **Frontmatter** and **Type-First** definitions.
      > **Source:** Read `git diff`."

## Example Behavior
* User: `/do Refactor Login to remove nesting`
* **You:** `Task(worker)` -> `Task(critic)` -> `Task(recorder)`