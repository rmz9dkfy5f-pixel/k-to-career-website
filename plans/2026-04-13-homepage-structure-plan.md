# Homepage Structure Plan

## Objective
Propose the homepage information architecture for the K to Career website.

## Core Goal
Create a homepage structure that supports the website objective, speaks clearly to the primary homepage audience, and avoids vague nonprofit language. The structure must be grounded in the provided source documents, not generic assumptions.

## Source Inputs
Use only these inputs unless explicitly told otherwise:
- `CLAUDE.md`
- `docs/strategy/K_to_Career_Ecosystem.md`
- `plans/k_to_career_action_plan.md`

## Operating Rules
1. Planning only. Do not write implementation code, edit files, draft components, or propose technical changes.
2. Work in approval-gated slices. Complete only the current slice, then stop.
3. Do not proceed past Slice 1 without explicit approval.
4. Separate strategy decisions from page-copy decisions at all times.
5. Do not use generic nonprofit language when more specific, source-backed language is available.
6. Base conclusions on the source documents. Do not invent goals, audiences, sections, or messaging not reasonably supported by the inputs.
7. When the source material is unclear, conflicting, incomplete, or inaccessible:
   - state the issue explicitly
   - distinguish fact from inference
   - make the minimum necessary assumption only if required to complete the slice
   - label that assumption clearly
8. If multiple audiences are present, identify:
   - the primary homepage audience
   - any important secondary audiences
   - the tradeoff created by serving more than one audience
   Prioritize the homepage structure around the primary audience unless the documents clearly require a multi-audience homepage.
9. Do not drift into visual design, styling, wireframes, implementation details, analytics plans, SEO plans, or full page copy before the correct slice.
10. Keep the output concise, structured, and decision-oriented.

## Decision Standard
For every recommendation, optimize for:
- clarity of homepage purpose
- alignment with the website objective
- relevance to the primary audience
- concrete value over generic mission language
- section order that supports comprehension and action

## Slice 1
Read the strategy and action-plan documents and determine:
- the primary homepage audience
- the core homepage message
- the required homepage sections

### Slice 1 Deliverable
Return only these sections in this order:

#### 1. Source-Based Findings
- Website objective
- Primary homepage audience
- Secondary audience(s), if any
- Core homepage message

For each item:
- state the conclusion in one sentence
- provide a brief rationale based on the source material
- clearly label any inference or uncertainty

#### 2. Proposed Homepage Section Outline
List the proposed homepage sections in recommended order.

For each section include:
- section name
- why this section is needed
- what job it does on the homepage
- which audience it primarily serves

#### 3. Major Ambiguities or Risks
List only the ambiguities or risks that could materially change the homepage structure, such as:
- unclear primary audience
- conflicting strategic goals
- too many audiences competing for the homepage
- weak or diffuse calls to action
- messaging that risks becoming generic

For each risk include:
- the risk
- why it matters
- how it could affect the structure

#### 4. Stop
End with:
`Stop here. Awaiting approval before Slice 2.`

## Slice 2
Only after approval, draft a short purpose statement for each approved homepage section.

### Slice 2 Deliverable
Return only:
- approved section name
- 1 to 3 sentences explaining the role of the section
- recommended section order
- the audience each section primarily serves
- any note where a section risks overlap, redundancy, or dilution

End with:
`Stop here. Awaiting approval before Slice 3.`

## Slice 3
Only after approval, draft a homepage copy skeleton for the approved structure.

### Slice 3 Deliverable
Return only:
- homepage headline options
- homepage subheadline options
- primary and secondary call-to-action options
- placeholder copy skeleton for each approved section

Requirements for Slice 3:
- keep copy directional, not polished
- do not use vague mission-heavy language unless the source documents explicitly justify it
- keep calls to action concrete and tied to the site goal

End with:
`Stop here. Awaiting approval for any further refinement.`

## Non-Negotiable Boundaries
- Do not skip slices.
- Do not combine slices.
- Do not produce implementation work.
- Do not produce homepage copy in Slice 1.
- Do not optimize for sounding nice; optimize for strategic clarity and execution reliability.
- If a source file is missing or unavailable, say so explicitly and explain how that limits the recommendation.

## Quality Bar
A strong response will:
- identify a defensible primary homepage audience
- produce a homepage structure that is clearly tied to the site objective
- avoid generic nonprofit phrasing
- surface the few risks that actually affect structure
- stop exactly at the end of the current approved slice

## What Changed
- Tightened the task so the model stays on homepage information architecture and does not drift into copy, design, or implementation too early.
- Added explicit rules for missing files, conflicting documents, weak evidence, multi-audience tension, and fact-versus-inference handling.
- Rebuilt the slice deliverables into strict output sections so results are more consistent, reviewable, and approval-gated.

## Scorecard
- Intent Preservation: 5/5
- Clarity: 5/5
- Constraint Strength: 5/5
- Output Specificity: 5/5
- Edge-Case Coverage: 5/5
- Reusability: 5/5
- Testability: 4/5
- Compression Efficiency: 4/5
- Total: 38/40

## Version Recommendation
- Version bump: minor
- Schema bump needed: no
- Why: The prompt’s purpose, audience, and workflow remain the same, but its execution logic, guardrails, and output structure were materially strengthened. This is more than a wording cleanup but does not change the underlying prompt schema or core task.

## Remaining Risks
- The source documents may still be too ambiguous to support a confident single-audience homepage without making judgment calls.
- Even with stronger guardrails, the model may still infer too much if the strategy docs are weak, contradictory, or overly broad.