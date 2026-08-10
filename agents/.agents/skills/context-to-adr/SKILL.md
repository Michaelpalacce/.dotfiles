---
name: context-to-adr
description: Converts architectural decisions captured in branch-scoped context files (via context-skill) into formal, concise Architecture Decision Records (ADRs). Use this skill when the user asks to "generate ADRs", "convert context to ADR", or "document decisions".
---

# SKILL: Context to ADR Conversion

**Description:**
A workflow to distill architectural decisions gathered during branch development (often stored via `context-skill`) into formal, standardized, and concise Architecture Decision Records (ADRs). This skill uses a streamlined version of the MADR (Markdown Architecture Decision Record) format.

## 🎯 When to Use
Invoke this skill when the user explicitly requests to document decisions, generate ADRs, or convert branch context into permanent architectural records. 

## 📍 ADR File Location
ADR documents should be stored in the repository's documentation directory, typically:
`<PROJECT_ROOT>/docs/decisions/` (Create this directory if it doesn't exist).

File naming convention: `NNNN-short-title.md` (e.g., `0001-use-postgresql-for-user-data.md`), where `NNNN` is a sequential 4-digit number.

## 🔄 The Conversion Workflow

### Phase 1: Ingest Context
1. Locate the project's branch context file. By default, `context-skill` stores this at `$HOME/llm/context/<PROJECT_DIR_NAME>/<ACTIVE_BRANCH_NAME>.md`. 
2. Read the context file and extract the "Design decisions made (with why)" section.
3. If no decisions are present, inform the user that no architectural decisions were found to convert.

### Phase 2: Formulate ADRs
For each significant architectural decision found in the context file (or specified by the user):
1. **Determine the next sequential number** by listing existing files in `<PROJECT_ROOT>/docs/adr/`. If the directory is empty, start with `0001`.
2. **Draft the ADR** using the concise MADR template below. 
3. **Be Concise but Complete:** Distill the problem and solution to their essence. Avoid unnecessary verbosity, filler text, or overly long explanations, but ensure the core *why* and *what* are perfectly clear.

### Phase 3: Write and Link
1. Save the generated ADR(s) to `<PROJECT_ROOT>/docs/adr/NNNN-title-in-kebab-case.md`.
2. (Optional but recommended) Summarize to the user which ADRs were created and briefly state the core decision for each.

---

## 📝 Concise MADR Template

Use the following Markdown template (based on the MADR standard, optimized for brevity). Do not add filler text. 

```markdown
# [Short Title of Solved Problem and Solution]

* Status: [proposed | accepted | rejected | deprecated | superseded]
* Date: [YYYY-MM-DD]

## Context and Problem Statement

[Describe the context and problem statement in 2-3 sentences. Why did this need a decision?]

## Considered Options

* [Option 1 - e.g., The chosen approach]
* [Option 2 - e.g., Alternative considered (if any mentioned in context)]

## Decision Outcome

Chosen option: **[Option 1]**, because [Concise justification based on the "why" in the context file].

### Consequences

* **Positive:** [What becomes easier, faster, or better?]
* **Negative:** [What becomes harder, slower, or what trade-offs/technical debt are introduced?]
```