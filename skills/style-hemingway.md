---
name: style-hemingway
description: The Core Style Protocol. Terse, High-Signal, Iceberg Principle. Composition over Inheritance.
type: skill
id: style-hemingway
---

# Skill: Hemingway Style

**MANDATE:** Eliminate noise. Maximize signal. Code is Literature.
**TRIGGER:** All content generation (Docs, Code, Chat).

## 🧠 CORE PHILOSOPHY

1.  **The Iceberg Principle:**
    * **Surface (1/8):** Simple, clean Interfaces and Public APIs.
    * **Depth (7/8):** Complexity is encapsulated internally.
    * *Rule:* The caller should never know how hard the implementation was.

2.  **No Fluff (Zero Tolerance):**
    * **DELETE:** "In this section...", "I will now...", "Here is the code...", "I hope this helps."
    * **KEEP:** The solution. The code. The facts.

## 📐 ARCHITECTURAL STANDARDS

1.  **Composition > Inheritance:**
    * **BANNED:** Deep class hierarchies (`AbstractManager` -> `BaseService` -> `UserService`).
    * **MANDATED:** Composition, Hooks, Traits, and Functional pipelines.
    * *Why:* Inheritance creates brittle coupling. Composition creates flexible code blocks.
    * *Rule:* **Has-a** > **Is-a**.

2.  **Type-First Design:**
    * Define the `Interface` or `Type` **BEFORE** writing the logic.
    * Data shape drives implementation.

## 📝 CODING STANDARDS

1.  **Flatten the Curve (Early Returns):**
    * **Max Nesting:** 2 levels.
    * **Pattern:** Guard Clauses.
    * *Bad:* `if (user) { if (active) { ... } }`
    * *Good:* `if (!user || !active) return;`

2.  **Naming Protocol:**
    * **Concrete:** `User`, `Account`, `Login`.
    * **Banned (Bureaucracy):** `Abstract`, `Impl`, `Manager`, `Helper`, `Object`.
    * *Rule:* If you need "Manager" in the name, you haven't defined the responsibility clearly.

3.  **Comments (Why vs What):**
    * **Banned:** Comments that explain *what* code does (e.g., `// loop through array`).
    * **Allowed:** Comments that explain *why* a decision was made (e.g., `// Optimization for large datasets`).

## 📄 DOCUMENTATION STANDARDS

1.  **Format:**
    * **Lists > Paragraphs.**
    * **Pseudocode > Prose.**

2.  **Structure:**
    * Start with **Frontmatter** (`id`, `type`).
    * State the **Goal** immediately.
    * Show the **Data Model**.

## ✨ EXAMPLES

### ❌ Bad (Verbose, Inheritance, Nested)
```typescript
// Bureaucratic naming, inheritance trap
class UserDataManager extends AbstractDataManager {
  // Loop through users to find admin
  findAdmin(users: any[]) {
    if (users) {
      for (let i = 0; i < users.length; i++) {
        if (users[i].role === 'admin') {
          return users[i];
        }
      }
    }
  }
}

```

### ✅ Good (Hemingway, Composition, Flat)

```typescript
// Composition (Functional), Type-First, Flat
type User = { role: 'admin' | 'user' };

const findAdmin = (users: User[]): User | undefined => {
  if (!users.length) return; // Guard clause
  return users.find(u => u.role === 'admin');
};

```