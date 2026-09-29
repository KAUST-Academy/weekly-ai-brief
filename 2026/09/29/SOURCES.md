# Sources — Weekly AI Brief #06
**Window covered:** 2026-09-23 to 2026-09-29 (7 days)
**Compiled:** 2026-09-29 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Introducing Claude Sonnet 5.5](https://www.anthropic.com/claude-sonnet-5-5) | Anthropic | lab blog | 2026-09-28 | 2026-09-29 | API ID `claude-sonnet-5-5`; $2/$10 per 1M, cache reads $0.20, cache writes $2.50; AWS/Google Cloud/Azure availability; "30%+ faster than Sonnet 5"; "up to 30% less per task"; the full self-reported table in §3 (Terminal-Bench 4.0 70.6 vs Sonnet 5 10.3 vs Opus 5.5 66.4; FrontierCode 1.1 Main 46.2/54.4/GPT-6 Sol 49.3; GDPval-AA v2.1 1844/1846/1487; AA-Briefcase v1.1 1811/1822/1483; Chartography **no tools** 61.6/64.4/53.6; OSWorld 2.1 80.1/81.8). Page states no context window. Footnote: Terminal-Bench GPT-6 Sol not publicly reported |
| S2 | [Claude Sonnet 5.5](https://artificialanalysis.ai/models/claude-sonnet-5-5) | Artificial Analysis | leaderboard | n/a (live page) | 2026-09-29 | Intelligence Index v4.3.2 score 56, #3 of 216; 1M context; 410M output tokens during evaluation vs 88M median ("very verbose"). Page also lists TTFT 370.76 s, which looks anomalous and is **not used** |
| S3 | [Introducing GPT-6 Sol and Luna](https://openai.com/index/introducing-gpt-6-sol-and-luna/) | OpenAI | lab blog | 2026-09-22 (date from S19 and OpenAI's related-post listing; page body carries no date) | 2026-09-29 | Pricing table ($4→$2 / $20→$10 Sol; $0.20→$0.10 / $1.20→$0.50 Luna; 50% cheaper vs GPT-5.6 promotional pricing); "similar methods as GPT-6 Astra"; DeepSWE v1.1 68.8% Sol max, 1.1 pts below Claude Fable 5 69.9% xhigh, ~80% lower cost per task; factuality "about half as many mistakes", with the caveat that the eval is built from user-flagged-error conversations; 90% cached-input discount; API IDs `gpt-6-sol`, `gpt-6-luna`; AutomationBench 1.0.6 table with Claude Opus 5 (max) 26.9%. Read via `scripts/fetch_openai.py` (direct fetch succeeded on retry) |
| S4 | [GPT-6 Sol (max)](https://artificialanalysis.ai/models/gpt-6-sol) | Artificial Analysis | leaderboard | n/a (live page) | 2026-09-29 | Intelligence Index v4.3.2 score 48, #20 of 216; 872K context; released 2026-09-22 |
| S5 | [Introducing Claude Opus 5.5](https://www.anthropic.com/claude-opus-5-5) | Anthropic | lab blog | 2026-09-22 | 2026-09-29 | $4/$20 per 1M, fast mode $8/$40; "40% less to run than Opus 5"; Terminal-Bench 4.0 66.4 vs GPT-6 Astra 57.9; AutomationBench 40.0 vs Astra 41.4, Opus 5 26.9; Terminal-Bench-Science 58.7 vs Astra 64.6; Chartography 89.0% **with tools** (the harness discrepancy discussed in §3). One day outside the window; the report says so |
| S6 | [Claude Opus 5.5](https://artificialanalysis.ai/models/claude-opus-5-5) | Artificial Analysis | leaderboard | n/a (live page) | 2026-09-29 | Intelligence Index v4.3.2 score 58, #1 of 216; 1M context; released 2026-09-22 |
| S7 | [MiMo-V2.6-Pro-MOPD](https://huggingface.co/XiaomiMiMo/MiMo-V2.6-Pro-MOPD) | Xiaomi MiMo | model card | 2026-09-27 (HF API `createdAt`) | 2026-09-29 | MIT licence; 1.02T total / 42B active; 1M context; text/image/video/audio; MOPD2 multi-teacher on-policy distillation; tool-call repetition quote. Flash-MOPD card (same date) gives 309B total / 15B active |
| S8 | [MiMo-V2.6-Pro-RL](https://huggingface.co/XiaomiMiMo/MiMo-V2.6-Pro-RL) | Xiaomi MiMo | model card | 2026-09-21 (HF API `createdAt`) | 2026-09-29 | RL checkpoints posted 21–22 Sep; self-reported evaluation table: DeepSWE v1.1 Pro 71.9 vs Claude Opus 5 74.0; AutomationBench v1.0.6 Opus 5 **50.3** (contradicts the 26.9 in S3 and S5 — used in §3 as evidence of harness divergence) |
| S9 | [Claude discovers a novel enzyme system with CRISPR-like repeats](https://www.anthropic.com/news/claude-discovers-novel-enzyme-system) | Anthropic | lab blog | 2026-09-23 | 2026-09-29 | ~950 agents, 21 hours, 210M tokens; ART in bacteriophages; Claude Code / Claude Science tools |
| S10 | [Autonomous AI agents discover reverse transcriptases with tandem repeat arrays](https://www.alphaxiv.org/abs/2609.ai-agents-discover-reverse-transcriptases) | Yoon, Athukoralage, Ameisen, Kauderer-Abrams, Perry, Durrant (Anthropic) | paper | 2026-09-23 | 2026-09-29 | 1.9B protein clusters; ~200-nt repeat units; 95 ART RT clusters, 28 with upstream arrays; verbatim "ART's biochemical activity and biological function remain untested" |
| S11 | [Just-in-Time Memory](https://arxiv.org/abs/2609.27334) | Zhou, Li, Liu, Yavuz, Joty (arXiv:2609.27334) | paper | 2026-09-23 | 2026-09-29 | Read-time curation of raw trajectories; +16.2 ALFWorld, +16.3 WebShop, +3.9 τ²-bench absolute over strongest baseline; no code link on arXiv page |
| S12 | [Learning to Discover Interesting Mathematics](https://arxiv.org/abs/2609.28603) | Patel, Rammal, Hayat, Munos, Kempe (arXiv:2609.28603) | paper | 2026-09-23 | 2026-09-29 | Interestingness = proof length / statement length; 27B difficulty predictor; Mathlib overlap 91.9% → 30.6%; no code link |
| S13 | [Your Transformer Can Hold Two Thoughts at Once](https://arxiv.org/abs/2609.29845) | Tikhonov et al. (arXiv:2609.29845) | paper | 2026-09-24 | 2026-09-29 | Linear superposition of next-token distributions; architectural not learned, weakens with training, restored by fine-tuning; two continuations per forward pass; no code link |
| S14 | [Block Sparse Attention with Log-Linear Complexity](https://arxiv.org/abs/2609.31093) | Tang, Qin, Pan, Li, Liu (arXiv:2609.31093) | paper | 2026-09-25 | 2026-09-29 | PISA pyramid Top-K selection; O(log N) levels, O(N log N) overall; fused Triton kernels; comparable commonsense, better retrieval; abstract gives no speed figure and no code link |
| S15 | [Security Council 10228th meeting](https://transcripts.un.org/en/sc/10228) | United Nations | regulation | 2026-09-23 | 2026-09-29 | Meeting number, agenda title, French presidency (Barrot), briefers Bengio/Altman/Amodei/Delangue; Amodei's three proposals verbatim; Kratsios quote verbatim |
| S16 | [Casar, Sanders introduce legislation to create new federal agency, ban artificial superintelligence](https://casar.house.gov/media/press-releases/news-casar-sanders-introduce-legislation-create-new-federal-agency-ban) | Office of Rep. Greg Casar | statement (primary) | 2026-09-23 | 2026-09-29 | Bill name; superintelligence definition verbatim; pause; cabinet-level Department of AI; up to 20 years' imprisonment. The Sanders Senate page returned 403 |
| S17 | [Governor Kotek issues executive order to advance AI safety and oversight](https://apps.oregon.gov/oregon-newsroom/OR/GOV/Posts/Post/governor-kotek-issues-executive-order-to-advance-ai-safety-and-oversight) | Office of the Governor of Oregon | regulation | 2026-09-23 | 2026-09-29 | EO 26-26 title; third-party review standards; kill-switch assessment; 90-day CIO proposal; procurement scope |
| S18 | [Announcing OpenAI DevDay 2026](https://openai.com/index/devday-2026/) | OpenAI | lab blog | undated on page | 2026-09-29 | DevDay on 29 September in San Francisco. Read via `scripts/fetch_openai.py` |
| S19 | [OpenAI launches GPT-6 Sol and Luna](https://techcrunch.com/2026/09/22/openai-launches-gpt-6-sol-and-luna/) | TechCrunch | press | 2026-09-22 | 2026-09-29 | Launch date 22 Sep (the OpenAI page carries none); Opus 5.5 released "approximately 90 minutes" earlier |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`, `statement (primary)`.

---

## 2. Also reviewed, not included

### Opened and verified, cut for relevance or page budget

| Item | URL | Why it did not make the issue |
|---|---|---|
| Training Object Permanence in World Models (2609.28654, 23 Sep, 333 HF votes) | https://arxiv.org/abs/2609.28654 | Opened: WROP, 150 tasks, 1.5M-sample corpus, 14 video models, 16B PWM-WROP ranked 3rd. Sixth paper; cut for budget. First to reinstate |
| ExplorationBench (2609.30199, 24 Sep) | https://arxiv.org/abs/2609.30199 | Opened: AlienCode 31 targets/70 tasks, AlienLogic 24/70, 10 systems. Benchmark with no headline number worth carrying |
| Disaggregated Quantization (2609.26333) | https://arxiv.org/abs/2609.26333 | Opened: Panferov…Alistarh; 1.78x TTFT on 27B; dated **22 Sep**, one day outside, no code link |
| Capable yet Parsimonious: hidden CoT extraction on GPT-6 Astra (2609.26637) | https://arxiv.org/abs/2609.26637 | Opened: dated **22 Sep**, outside window; method not disclosed on the abstract page |
| Schrödinger's Code Repository: SWE-bench memorisation (2609.27891) | https://arxiv.org/abs/2609.27891 | Opened: submitted **21 Aug 2026**, well outside; code at github.com/cslsolow/Schrodinger-Repo. Relevant to §3 but not new |
| Hunyuan-A13B Technical Report (2609.27284) | https://arxiv.org/abs/2609.27284 | Opened: 80B/13B MoE, 20T tokens, dated 23 Sep. No weights link on the page and the model name matches an earlier Tencent release; did not establish what is new. Not used |
| UN News, "Who should set the rules for AI?" | https://news.un.org/en/story/2026/09/1168353 | Dated **16 Sep**; background only. Security Council transcript (S15) used instead |
| Al Jazeera, CEOs tell UN industry needs global regulation | https://www.aljazeera.com/news/2026/9/24/ai-corporate-leaders-tell-un-the-industry-needs-global-regulation | Secondary; superseded by the UN transcript (S15) |
| Transparency Coalition legislative update (25 Sep) | https://www.transparencycoalition.ai/news/ai-legislative-update-september25-2026 | Aggregator. Led to Oregon (S17). Illinois and California executive orders not traced to a governor's-office primary this run; California AB 1792 (signed 25 Sep) is narrow (school curriculum) |

### Outside the window, or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| Cohere–Aleph Alpha definitive merger agreement | https://siliconangle.com/2026/09/16/cohere-and-aleph-alpha-agree-to-merge-in-reported-20b-deal/ | Signed **16 Sep**, previous window; missed by #05 but not a release-level item worth carrying late |
| Grok 4.7, Qwen-Image-2.1, LimiX-2, Gemini 3.8 Live | see issue #05 | Covered in #05; no new artifact |
| GPT-6 Astra | see issues #02–#03 | Covered; S3 only references it |
| Hugging Face trending: Qwen-Image-2.1 derivatives, Xing4.0-29B-A4B, ZDTaichu5.0-9B, Nemotron-3-Diarization, Ternary-Bonsai-2-27B | https://huggingface.co/models?sort=trending | Mostly community quantisations/fine-tunes or pre-window; none opened in depth |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| Gemini 4 "in early post-training", release before year end (Kavukcuoglu, 24 Sep) | https://www.gurufocus.com/news/9094960/googles-deepmind-nears-launch-of-gemini-4-ai-model | Paraphrase in an investor-news article with no quote and no originating outlet; no Google primary found. Not used |
| OpenAI "Towards safety cases for frontier AI training"; "Priorities and principles for third-party assessments" | https://openai.com/index/towards-safety-cases-for-frontier-ai-training/ | Listed in OpenAI's sitemap with 29 Sep re-render dates; `fetch_openai.py` got 403 direct and 429 from the archive after retries. **Primary could not be read, so neither is reported.** Next week should retry |
| OpenAI DevDay announcements | https://cellcog.ai/blog/openai-devday-2026/ | Keynote falls on publication day; pre-event lists are rumour. Deferred to #07 |
| Anthropic Sonnet 5.5 / cache diagnostics / plugin portal release notes (23, 25 Sep) | https://releasebot.io/updates/anthropic | Aggregator only; not opened at primary |
| Sanders–Casar Senate press release | https://www.sanders.senate.gov/press-releases/news-sanders-casar-introduce-legislation-to-create-new-federal-agency-to-ban-artificial-superintelligence-pause-advanced-ai-development/ | 403; the House co-sponsor's release (S16) used instead |
| Xi–Trump AI remarks; Zuckerberg NBC interview | https://aiweekly.co/ai-news-today/edition/2026-09-25 | Digest only; no transcript opened |
| Ember-1, Aion 3.5, FLUX 3 Action, Span-01, Perceptron Mk1.5, Eleven v4 | https://www.digitalapplied.com/blog/ai-model-releases-september-2026-tracker | Tracker listing only; primaries not opened; lower relevance than the four selected releases |

---

## 3. Method

- **Window:** the seven days ending 2026-09-29, inclusive (23–29 September).
- **Beats swept:** releases (Anthropic news, OpenAI sitemap via `fetch_openai.py`, HF trending and XiaomiMiMo org via HF API, release trackers), research (HF daily papers for 24, 25 and 28 Sep; arXiv abs pages), benchmarks (Artificial Analysis model pages; vendor tables), industry/policy (UN transcripts, congressional and state primaries).
- **Late items:** GPT-6 Sol/Luna and Claude Opus 5.5 launched 22 Sep, after issue #05 was compiled, and were not covered there. Both are carried with a sentence saying so.
- **Verification:** every figure, identifier and date in the report was read from the primary source above on 2026-09-29. Vendor benchmark numbers are labelled self-reported; only the Artificial Analysis row is independent.
- **Known gaps:** two OpenAI safety posts unreadable (403/429); LMArena not attempted (unreachable in prior runs); no Gulf/MENA item found in window with a primary; the industry beat has no funding item this week because none in-window was traced to a filing or company release.
