# The four beats: where to look

Sweep all four. Search first to find leads, then fetch the primary page for anything
that will appear in the brief. Sources below are starting points, not a closed list --
the story of the week may live somewhere none of these cover.

Every search query should carry the window explicitly ("August 2026", "this week",
"past 7 days"). Undated queries return last year's news with confidence.

---

## Beat 1 — Model and product releases

**Primary (the announcement itself, always preferred):**

| Lab | Where |
|---|---|
| OpenAI | openai.com/news, openai.com/index/ |
| Anthropic | anthropic.com/news |
| Google DeepMind | deepmind.google/discover/blog, blog.google/technology/ai |
| Meta AI | ai.meta.com/blog |
| Mistral | mistral.ai/news |
| Alibaba Qwen | qwenlm.github.io/blog |
| DeepSeek | api-docs.deepseek.com/news, their HF org |
| xAI | x.ai/news |
| Microsoft | azure.microsoft.com/en-us/blog, microsoft.com/en-us/research/blog |
| NVIDIA | blogs.nvidia.com, developer.nvidia.com/blog |
| Cohere / AI2 / Hugging Face | cohere.com/blog, allenai.org/blog, huggingface.co/blog |

**Aggregate sweep:** Hugging Face trending models (`huggingface.co/models?sort=trending`)
surfaces open releases the blogs miss. Model cards are primary for licence, size and context.

**Record for every release:** exact version string, parameter count, context window,
licence, what is actually available (weights / API / waitlist), price if stated, and the
benchmark table *as the lab reports it* -- flagged as self-reported.

---

## Beat 2 — Research

- **arXiv new listings** -- `arxiv.org/list/cs.CL/recent`, `cs.LG`, `cs.AI`, `cs.CV`.
  High volume; skim titles, open abstracts, fetch the abs page for anything you cite.
- **Hugging Face daily papers** -- `huggingface.co/papers` -- community-ranked, good signal.
- **alphaXiv / Papers with Code / Semantic Scholar** -- trending and citation context.
- **Lab research pages** -- DeepMind, FAIR, MSR, Anthropic research often post the paper
  and a readable summary the same day.

**Prefer:** released code or weights; a result that contradicts a common assumption;
a method that is cheap to adopt. **Discount:** +0.3 on a saturated benchmark, single-seed
results, papers whose only claim is scale.

**Record:** arXiv ID (copied, never reconstructed), institution, the headline number *with
its baseline and setup* (model size, dataset, compute), and whether code exists.

---

## Beat 3 — Benchmarks, evaluations, reproductions

- LMArena / Chatbot Arena leaderboard -- human-preference Elo, and its movement
- Artificial Analysis -- independent latency, price and quality measurements
- SWE-bench (Verified), ARC-AGI, GPQA, AIME, Terminal-Bench, and domain leaderboards
- Epoch AI -- compute trends, training-run estimates
- Independent reproductions and contamination analyses -- often blog posts or X threads
  that later become papers; treat as preliminary and label them so

**The question this beat answers is always "is the movement real?"** Note the evaluation
harness, whether the setup matches the previous holder's, and who ran it. A self-reported
score and a leaderboard-verified score are not comparable and must not share a column
without a note.

---

## Beat 4 — Industry, funding and policy

- Funding, acquisitions, compute deals, datacenter and chip supply
- Regulation: EU AI Act implementation dates, US federal and state action, UK/China/Gulf
  policy, export controls
- Access changes: pricing, deprecations, rate limits, licence changes on open models
- Safety and incident reporting: model cards, system cards, evaluations of misuse

**Sources:** company press releases and SEC/official filings first; Reuters, Bloomberg, FT,
The Information, TechCrunch for corroboration. Official gazettes and regulator sites for
policy -- never a news summary of a regulation when the text is one click away.

**Record:** the figure, the date, and who confirmed it. "Reportedly", "sources say" and
"is said to be in talks" belong in the brief only with that hedge preserved intact.

---

## Regional note

The audience is at KAUST. Where a Gulf/MENA angle genuinely exists -- Saudi/UAE compute
investment, Arabic-language models (ALLaM, Falcon, Jais, Fanar), regional policy -- it is
worth a line. Do not manufacture one when there is nothing to report.
