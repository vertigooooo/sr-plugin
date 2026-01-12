---
description: "Updates the project's 'Lessons Learned' database. Filters insights through Hemingway Style."
argument-hint: "[The lesson or insight]"
model: sonnet
---

# /memo

> **Goal:** Institutional Memory (High Signal, Low Noise).
> **File:** `/llmdoc/reference/lessons-learned.md`

## SOP

### Step 1: Ingest & Distill

1.  **Analyze User Input:**
    * *Input:* "{{USER_INPUT}}"
    * *Goal:* Extract the core technical truth.

2.  **Archive (The Recorder):**
    * **Action:** Call `Task(agent="recorder")`.
    * **Prompt:**
        > "Append this insight to `/llmdoc/reference/lessons-learned.md`.
        >
        > **CRITICAL CONSTRAINTS:**
        > 1.  **Doc Standard:** Ensure the file exists with valid **Frontmatter** (`id: lessons-learned`, `type: reference`).
        > 2.  **Hemingway Filter:** **REWRITE** the user's input to be terse, imperative, and factual. Remove 'I think', 'maybe', or generic fluff.
        >     * *Bad:* 'I tried using X but it failed so maybe we should avoid it.'
        >     * *Good:* 'Avoid X; causes instability in Context Providers.'
        > 3.  **Format:** `- **[YYYY-MM-DD] [Topic]:** [Terse Insight]`"

### Step 2: Indexing Confirmation

1.  **Feedback:**
    * Output: "📝 **Memo Saved.** Insight distilled and archived."