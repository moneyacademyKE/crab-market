---
name: unstuck
description: Anti-roadblock workflow for walls and dead ends - classifies the wall type, decompiles the word impossible, runs assumption autopsy plus lateral techniques, and outputs viable angles or an honest load-bearing verdict. Invoke as /unstuck <blocker description>.
---
# unstuck

No state, no schedule. Invoke: `/unstuck <what is blocked, what you tried, who or what said no>`.

## The model

"Impossible" is a claim, not a fact. It almost always decompiles into something weaker: *expensive*, *against the rules*, *nobody's done it*, *I don't know how*. Only physics and math end the session honestly.

| Wall type | What "impossible" means | Lead moves |
|---|---|---|
| **Assumption** | An inherited belief nobody re-verified | Assumption autopsy, first principles |
| **Framing** | The goal is stated so the answer is excluded | Altitude shift, inversion, work backwards |
| **Gatekeeper** | A person or org said no | Interrogate the no, find the analogical transfer |
| **Tool/tech** | "X doesn't support Y" | Substitute the primitive, compose around it |
| **Resource** | Not enough time/money/people | Constraint toggling, provocation |
| **Physics/math** | Actually impossible (rare) | Honest exit: reroute the goal |

## Run

1. **Capture the wall** in one pass: the goal (the job, not the blocked step), the exact blocker, attempts already made, the source of the no, stakes. If they say "I tried everything", get the list: it is usually 2-3 things.
2. **Classify** the wall type and say why. Decompile "impossible" into the weaker true statement.
3. **Assumption autopsy, always**: enumerate every assumption in the problem statement, mark verified fact vs inherited belief, attack the beliefs.
4. **Generate at least 10 angles before evaluating any.** Quantity first, judgment second. Most walls die at the autopsy or the altitude shift; if one does, say so and go straight to actions.
5. **Deliver**: 2-4 viable angles ranked, each with a concrete next action - or the honest verdict that the wall is load-bearing and the goal should reroute.

## Agent fast path

Agents: run this on yourself mid-task, BEFORE reporting a dead end. An approach failed twice, an API lacks the thing, a "that's not possible" sentence is forming - classify, autopsy, 10 angles, then report. Every dead-end report arrives with tried-angles receipts.

## Rules

- "It can't be done" without receipts is a banned output. Either angles or proof the wall is real.
- The verdict "this wall is load-bearing" is a success, not a failure: it saves the hours the wall would have eaten.
