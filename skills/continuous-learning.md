---
name: continuous-learning
description: Protocol for extracting reusable patterns from session context.
type: skill
id: continuous-learning
---

# Skill: Pattern Extraction (Continuous Learning)

**MANDATE:** Convert "Experience" into "Asset".
**GOAL:** Prevent history from repeating itself.
**TRIGGER:** End of Mission / Session (`/sr:mission` Phase 6).

## 🧠 THE ALGORITHM

### Step 1: Scan (The Review)
* **Input:** The diffs, errors encountered, and architectural decisions made during the session.
* **Question:** "Did we solve a problem that might happen again in a different context?"

### Step 2: Filter (The Gate)
* **ISOLATED Fix (Noise):** "Fixed typo in `header.tsx`." -> **DISCARD**.
* **UNIVERSAL Fix (Signal):** "Fixed race condition by wrapping state update in `useEffect` cleanup." -> **KEEP**.

### Step 3: Abstract (The Generalization)
* **Remove:** Specific file names (`UserLogin.ts`), variable names (`currentUser`), project-specific IDs.
* **Keep:** The Pattern, The Principle, The Trap.

### Step 4: Format (The Hemingway Rule)
* **Style:** Imperative. Terse. No "I learned that...".
* **Template:** `- **[Topic/Tag]** Rule Name: The Instruction. (Context: The Why)`

## 💾 STORAGE PROTOCOL

* **Target File:** `llmdoc/reference/lessons-learned.md`
* **Integrity Check:**
    * If file exists: Append to the end.
    * If missing: Create with Frontmatter (`id: lessons-learned`, `type: reference`).

## 🚫 NEGATIVE CONSTRAINTS (What NOT to save)

1.  **NO DIARY ENTRIES:** Do not write "Today I learned...". Write "Always do X...".
2.  **NO OBVIOUS STATEMENTS:** Do not write "Remember to run tests". (That is standard SOP).
3.  **NO PROJECT NOISE:** Do not mention specific user names, ticket numbers, or temporary file paths.

## ✨ EXAMPLES

### ❌ Bad (Too Specific / Verbose)
* "I fixed the login button on the home page by adding a debounce because it was clicking twice."
* "Maybe we should use Zod for validation next time."

### ✅ Good (Universal / Terse)
* "**[React]** Event Debounce: Always debounce submission handlers to prevent double-post. (Context: High latency networks)"
* "**[Validation]** Zod Strict Mode: Use `.strict()` on API schemas to reject unknown keys at the edge."