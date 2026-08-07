---
name: context-skill
description: Branch-scoped context handoff workflow — reads and updates $HOME/llm/context/<project>/<branch>.md so multiple LLM agents working asynchronously on the same branch can share decisions, backlog, and gotchas. Invoke ONLY when the user explicitly asks for it (e.g. "/context-skill", "load branch context", "update the context file"). Do not invoke automatically at the start or end of a task.
---

# SKILL: Branch Context Management

**Description:**  
A workflow to ensure seamless collaboration between multiple LLM agents (and humans) working asynchronously on the same project branch. This skill enforces reading, auditing, and updating a centralized, branch-specific context file before and after any code changes.

## 🎯 When to Use
This skill is **invoked on request only** — the user asks for it explicitly. Never invoke it
on your own initiative, and do not re-invoke it later in the session.

Once invoked, apply it to the work at hand:
- **Ingest** the branch context before touching code (Phase 1).
- **Upkeep** the context file before handing control back to the user (Phase 3) — this
  applies to the session you were invoked in, and does not require a second invocation.
- Record new architectural quirks, significant design decisions, and blockers as you hit them.
- **Compact** the context if requested or if the file becomes excessively large.
- **Reset** the context if the user asks to start from scratch.

## 📍 Context File Location
The single source of truth for branch context is strictly located at:
`$HOME/llm/context/<PROJECT_DIR_NAME>/<ACTIVE_BRANCH_NAME>.md`

*Action:* Use `basename $(pwd)` and `git branch --show-current` to resolve this exact path dynamically. If the directory or file does not exist, you must create it.

## 🔄 The Context Workflow

### Phase 1: Audit & Ingest (Pre-Execution)
1. **Locate & Read:** Read the context file for the current branch. If it's missing, initialize it using the **Context File Template** below.
2. **Verify Against Reality:** Branches move and humans make manual commits. Briefly verify the context file's claims (e.g., "Is task X actually implemented in `auth.go` as the file claims?"). 
3. **Internalize:** Use the documented `Decisions made` and `Gotchas` to constrain your planned approach. Do not violate established decisions without explicit user permission.

### Phase 2: Act (Execution)
1. Proceed with the user's requested task.
2. If you hit a roadblock, discover a new codebase constraint, or make a design choice, keep it in your scratchpad to record later.

### Phase 3: Upkeep (Post-Execution / Handoff)
Before reporting completion to the user, you MUST write back to the context file:
1. **Update Backlog:** Check off completed items (`[x]`). Add newly discovered tasks (`[ ]`).
2. **Record Decisions:** Add any structural or design decisions made during the session, explicitly stating the *rationale* (the "why").
3. **Log Gotchas:** Add any traps, weird behaviors, or upstream dependencies you discovered. Write this specifically to save the *next* agent time.
4. **Append Changelog:** Add a 1-2 sentence summary at the bottom of the file detailing what you just did and the current date/commit hash.

### Special Operations

**Resetting / Cleaning Context**
If the user explicitly asks to "reset context", "clean context", "forget everything", or "start from scratch":
1. Completely overwrite the existing context file with the empty **Context File Template** below, discarding all previous content.
2. Do not attempt to merge, match, or manually delete specific lines. Just replace the entire file content with the fresh template.

**Compacting Context**
Context files can grow large and consume excessive tokens, failing to fit in the local context. If the user asks to "compact context" or if the file feels unwieldy:
1. **Prune Backlog**: Remove `[x]` (completed) items that are no longer relevant to the current ongoing work.
2. **Condense Decisions & Gotchas**: Merge redundant points and summarize lengthy explanations while strictly preserving the core *why*.
3. **Summarize Changelog**: Collapse older changelog entries into a single, high-level summary bullet point (e.g., "- Pre-YYYY-MM-DD: Initial feature scaffolding and API integration").

---

## 📝 Context File Template
*If creating a new file, strictly use this markdown structure. Write for an audience of other LLMs: be concise, code-specific, and highly structured.*

```markdown
# <Feature/Topic> — working context

> **Audience**: LLMs/agents working on this feature. Keep this file updated: mark items done, add new findings, record decisions and their reasons. Verify claims against the code before acting on them — the branch moves.

## Snapshot
- **Goal**: <High-level goal of this branch>
- **PR/Issue**: <Link if applicable>
- **Status**: <Brief summary of current state>

## Design decisions made (with why)
1. **<Decision Name>**: <What was decided>. **Reason**: <Why it was decided over alternatives>.

## Backlog / Review Findings
Status legend: `[ ]` open, `[x]` done, `[~]` partially done.
- [ ] **<Item 1>**: <Details and target file/module>
- [ ] **<Item 2>**: <Details>

## Gotchas discovered (keep even after PR merges)
- <Unexpected behavior, architectural trap, or weird constraint the next agent MUST know about>

## Changelog
- YYYY-MM-DD: <Agent/User> - <Brief summary of what was accomplished and what is left>
```