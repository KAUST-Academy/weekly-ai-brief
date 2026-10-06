# Sources — Weekly AI Brief #07
**Window covered:** 2026-09-30 to 2026-10-06 (7 days)
**Compiled:** 2026-10-06 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Gemini 4 Argon: our next era of frontier intelligence](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-argon/) | Google (Koray Kavukcuoglu) | lab blog | 2026-09-30 | 2026-10-06 | Fairwind-only rollout; released to trusted defenders "without cyber guardrails"; paid API + AI Ultra next, no date; no API model ID given; output token limit 1M (up from 64K); intro price $2/$10, cached input 95% off, $4/$20 after intro period; self-reported DeepSWE v1.1 77.9% ("new state of the art"), AutomationBench 51.3% (#1), LVBench 91.7%, CWE-bench v1 68% (tied first); "leading model on the Vals Index" with no competitor scores |
| S2 | [Gemini 4 Argon (High)](https://artificialanalysis.ai/models/gemini-4-argon) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Intelligence Index v4.3.2 score 53, #8 of 224; released 2026-09-30; 1M context |
| S3 | [Introducing GPT-6.1 Sol](https://openai.com/index/introducing-gpt-6-1-sol/) | OpenAI | lab blog | 2026-09-29 (page body undated; date from S4, which announces it, and from OpenAI's related-post listing) | 2026-10-06 | API ID `gpt-6.1-sol`; $2 / $0.10 cached / $10 vs Astra $10/$50; cached input 50% below GPT-6 Sol; DeepSWE v1.1 matches Astra, +6.4 pts over GPT-6 Sol's best; AutomationBench +2.2 over Opus 5.5 at medium effort; fallback note on Claude Fable 5.1 (~40% of tasks); OSWorld 2.0 offline within 2.1 pts of Astra; Terminal-Bench Science $5.47 vs $23.80 Astra per task, Astra 68.1% top; Ultrafast "in the coming days". Read via `scripts/fetch_openai.py` (direct fetch succeeded) |
| S4 | [DevDay 2026 Recap](https://openai.com/index/devday-2026-recap/) | OpenAI | lab blog | 2026-09-29 | 2026-10-06 | Dots ("always-on agents"); Agents API computer use; Ultrafast up to 8x in Codex; Decisions API on Luna in limited preview, broad release "planned in the coming days". Read via `scripts/fetch_openai.py` |
| S5 | [GPT-6.1 Sol (Max)](https://artificialanalysis.ai/models/gpt-6-1-sol) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Intelligence Index v4.3.2 score 52, #11 of 224; released 2026-09-29; 1M context |
| S6 | [Kolibri-1](https://huggingface.co/Aleph-Alpha/Kolibri-1) | Aleph Alpha | model card | 2026-10-02 (HF API `createdAt`; card's own "Release Date" field says 3 October) | 2026-10-06 | Apache 2.0; 78B total / 3.46B active; 384 experts, 1 shared + 6 routed; 20T tokens (62.5% EN / 23.9% DE / 13.6% code); native 262,144 context, validated to 1,048,576; ~78 GB FP8, min 1x H200/B200; self-reported Overall EN 75.5 vs Qwen3.5-35B-A3B 74.7, DE 70.8 vs 69.8; SWE-bench Verified 66.4 vs Qwen3.6-35B-A3B 73.8; 392k GPU-h pre-training on B200; 6.4e23 FLOPs |
| S7 | [Clef](https://huggingface.co/Cloudflare/clef) | Cloudflare | model card | 2026-09-30 (HF API `createdAt`) | 2026-10-06 | Apache 2.0; post-trained from Qwen3.8-27B; typed-question schema in, per-option probabilities out in one forward pass, no free-text generation |
| S8 | [Clef decision models](https://blog.cloudflare.com/clef-decision-models) | Cloudflare | lab blog | 2026-10-01 | 2026-10-06 | Clef-Flash on Qwen3.5-9B; Clef CLINC150+OOS macro-F1 97.43, BANKING77 94.20; median latency Clef-Flash 38.8 ms vs Jev 524.1 ms (self-reported) |
| S9 | [Sharpening Tax in Post-Training](https://arxiv.org/abs/2610.01509) | Oh, Zeng, … Mirhoseini, Li (arXiv:2610.01509) | paper | 2026-10-01 | 2026-10-06 | Base models with light harness beat post-trained on pass@K; 14 pairs, 4 families, 3 benchmarks, 42 cases; PTGS improves pass@K and pass@1. No code link on abstract page |
| S10 | [RealCompanion](https://arxiv.org/abs/2610.01780) | Behnam, Kim, Yang (arXiv:2610.01780) | paper | 2026-10-01 | 2026-10-06 | 10 relationships, 27,218 messages, up to 120 days; 3.4% depend on earlier; median 2,157 back; 95.9% vs 2.2% recency hit; +10–14 pts with "memories" label; data released |
| S11 | [Science or Slop?](https://arxiv.org/abs/2610.00531) | Oh, Lee, Ahn, Kim, Kang (arXiv:2610.00531) | paper | 2026-09-30 | 2026-10-06 | 390 paired papers; 85.9% vs Binoculars 68.7%; ICLR 2017–2025 correlation; direct prompting reward-hacks; SciSlopHarness closes 63% of remaining gap |
| S12 | [Kandinsky 6.0 Video](https://arxiv.org/abs/2610.05608) | Team Kandinsky (arXiv:2610.05608) | paper | 2026-10-04 | 2026-10-06 | Lite 3B / Pro 29B; 5 s clips, 44 kHz audio with lip-sync; Full-HD SR; MIT licence; self-run human side-by-side evaluation. HF `kandinskylab` checkpoints created 2026-09-09 to 09-29 (checked via HF API) |
| S13 | [Claude Opus 5.5](https://artificialanalysis.ai/models/claude-opus-5-5) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Index v4.3.2 score 58, #1 of 224 |
| S14 | [Claude Sonnet 5.5](https://artificialanalysis.ai/models/claude-sonnet-5-5) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Index v4.3.2 score 56, #2 of 224. Release date 28 Sep confirmed on anthropic.com/news this run |
| S15 | [Claude Fable 5.1](https://artificialanalysis.ai/models/claude-fable-5-1) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Index v4.3.2 score 53, #5 of 224 |
| S16 | [GPT-6 Astra](https://artificialanalysis.ai/models/gpt-6-astra) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-06 | Index v4.3.2 score 53, #7 of 224 |
| S17 | [GLM-5.3 and the spread of advanced cyber capabilities](https://www.anthropic.com/research/glm-5-3-and-the-spread-of-advanced-cyber-capabilities) | Anthropic Frontier Red Team (Fasano, Fleischer, McFaul, Xiao, Gallagher) | lab blog | 2026-09-29 | 2026-10-06 | ExploitBench 50/410 vs Mythos Preview 56/410; bypass 64% (cover story), 92% (prefill), 100% (abliterated); abliteration ~2,200 GPU-h, ~$4,400; Claude at zero; cites NIST CAISI 17 Sep assessment ("most cyber-capable open-weight model released to date") |
| S18 | [California's nation-leading AI framework just got stronger](https://www.gov.ca.gov/2026/09/30/californias-nation-leading-ai-framework-just-got-stronger-governor-newsom-signs-more-first-in-the-nation-worker-protections-and-more/) | Office of the Governor of California | press | 2026-09-30 | 2026-10-06 | 13 bills listed (AB 1331, 1864, 1883, 1979, 2392, 2713; SB 503, 574, 947, 951, 1000, 1111, 1159) and their summaries; executive order keeping "Artificial Intelligence" |
| S19 | [Fact Sheet: President Donald J. Trump Inaugurates the Era of Super Intelligence](https://www.whitehouse.gov/fact-sheets/2026/09/fact-sheet-president-donald-j-trump-inaugurates-the-era-of-super-intelligence/) | The White House | regulation | 2026-09-29 | 2026-10-06 | Agencies to use "Super Intelligence"/"SI" and "no longer acknowledge" "AI"; APST to propose a federal definition. Fact sheet states no deadline and no industry accord, so neither is reported |
| S20 | [Anthropic invests $100 million to train 10,000 engineers](https://www.anthropic.com/news/claude-frontier-academy) | Anthropic | lab blog | 2026-10-02 | 2026-10-06 | $100M; 10,000 FDEs by end of 2027; in-person block + 12-week residency; Accenture, Bain, Capgemini, CBA, Deloitte, McKinsey, Morgan Stanley, Novo Nordisk |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| OpenAI, "Towards safety cases for frontier AI training" | https://openai.com/index/towards-safety-cases-for-frontier-ai-training/ | Carried over from #06 as unreadable; read this run via `fetch_openai.py`. Dated **28 Sep**, outside the window and a framework proposal with no new artifact |
| OpenAI, "Priorities and principles for effective third party assessments" | https://openai.com/index/priorities-principles-third-party-assessments/ | Read this run; dated **22 Sep**, two windows back |
| OpenAI, "On the Navier–Stokes Millennium Prize Problem" | https://openai.com/index/navier-stokes-solution/ | Dated **8 Sep**; the Alpöge–Buckmaster dispute coverage (Scientific American, Unite.AI) is also early September. Not new this week |
| OpenAI, "Our decision on Cursor following its acquisition by SpaceX" | https://openai.com/index/our-decision-on-cursor-following-its-acquisition-by-spacex/ | Dated **28 Aug**; Nov 12 shutoff date is a later watch item |
| OpenAI, "Separating signal from noise in coding evaluations" (SWE-Bench Pro ~30% broken) | https://openai.com/index/separating-signal-from-noise-coding-evaluations/ | Dated **8 Jul**; sitemap re-render only |
| OpenAI, "Introducing the Agents API" | https://openai.com/index/introducing-the-agents-api/ | Dated **10 Sep**; only the DevDay computer-use addition is reported (via S4) |
| OpenAI, "Introducing dots" | https://openai.com/index/introducing-dots/ | Dated 29 Sep; folded into the GPT-6.1 Sol entry via the DevDay recap rather than given its own entry |
| OpenAI sitemap: ~430 /index/ pages with lastmod ≥ 30 Sep | https://openai.com/sitemap.xml | Overwhelmingly re-renders (e.g. dozens of "disrupting-malicious-uses" pages from 2024–25); none besides the above surfaced as new |
| Claude Sonnet 5.5, Opus 5.5, GPT-6 Sol/Luna | see issue #06 | Covered; used only as table rows here |
| Anthropic, Barclays scales Claude (1 Oct) | https://www.anthropic.com/news/barclays-scales-claude | Customer story; no figures that change what builders do |
| On-Policy or Off-Policy Learning? (2609.35259) | https://arxiv.org/abs/2609.35259 | Opened: submitted **28 Sep**, outside |
| OSWorld-Pro (2609.24890) | https://arxiv.org/abs/2609.24890 | Opened: submitted **21 Sep**, outside |
| Raven: The Harness of Harnesses (2609.33439) | https://arxiv.org/abs/2609.33439 | Opened: submitted **27 Sep**, outside; abstract gives no numbers |
| Predictive Credit (2610.00314) | https://arxiv.org/abs/2610.00314 | Opened: submitted **29 Sep**, outside; result inconclusive by its own account |

### Opened, in window, but weaker than the selection

| Item | URL | Why it did not make the issue |
|---|---|---|
| Hierarchical Continuous Diffusion LMs (2610.02193) | https://arxiv.org/abs/2610.02193 | 1 Oct; small-scale (Sudoku, Countdown, LM1B) results, no headline numbers in abstract |
| ALoDLM: Adaptively Looped Diffusion LMs (2610.04198) | https://arxiv.org/abs/2610.04198 | 3 Oct; 1.7B/8B, beats AR baselines on average across 11 benchmarks, but the abstract gives no numbers; candidate if code appears |
| Beyond Memory: explicit belief states (2610.01415) | https://arxiv.org/abs/2610.01415 | 1 Oct; "highest overall performance" with no numbers in abstract |
| Latent-MOPD (2610.02381) | https://arxiv.org/abs/2610.02381 | 1 Oct; same-family distillation gains, no numbers in abstract |
| Cloudflare Clef-Flash card | https://huggingface.co/Cloudflare/clef-flash | Covered within the Clef entry via S8 |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| OpenAI reportedly negotiating ~$30B with UAE sovereign funds and BlackRock (6 Oct) | https://news.crunchbase.com/venture/biggest-funding-rounds-ai-space-fintech-temporal/ | Search-snippet level only, attributed to unnamed reports; no company statement. Gulf angle worth re-checking next week |
| Anthropic pre-IPO investor day, reportedly 14 Oct | https://www.bloomberg.com/news/articles/2026-10-01/anthropic-is-said-to-plan-pre-ipo-investor-day-as-listing-nears | Bloomberg unreachable (known); "is said to" single-source |
| White House Accord on Super Intelligence (industry signatories) | https://www.nextgov.com/artificial-intelligence/2026/09/white-house-unveils-super-intelligence-executive-order-and-industry-accord/416325/ | Not mentioned on the White House fact sheet (S19); EO PDF and accord text not opened. Not reported |
| California SB 951 "90-day notice / 25% of workforce" detail; SB 947 1 July 2027 start | https://www.transparencycoalition.ai/news/ai-legislative-update-october2-2026 | Aggregator detail not on the governor's release; bill text not opened. Report uses only the governor's wording |
| Microsoft MAI-Voice-2.1 / MAI-Transcribe-2-Streaming; Strands Decider 2B; Tavus Griffin-Lite; Bilibili Index-Translate-35B-A3B; Cohere Embed 5 | https://www.digitalapplied.com/blog/ai-model-releases-october-2026-tracker | Tracker listing only; primaries not opened; lower relevance than selected releases |
| DeepSeek-V4.1-Flash | https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash | HF `createdAt` 10 Sep — outside; tracker's "Oct 4" refers to a third-party repack |
| Instinct $1B Series C | https://news.crunchbase.com/venture/biggest-funding-rounds-ai-space-fintech-temporal/ | Crunchbase digest only; no company release opened |

---

## 3. Method

- **Window:** the seven days ending 2026-10-06, inclusive (30 September – 6 October).
- **Beats swept:** releases (OpenAI sitemap via `fetch_openai.py`, anthropic.com/news, Google blog, HF trending + HF API by org, release trackers); research (HF daily papers for 30 Sep, 1, 2, 5, 6 Oct; arXiv abs pages); benchmarks (Artificial Analysis model pages for six frontier models); industry/policy (gov.ca.gov, whitehouse.gov, Anthropic research/news).
- **Late items:** GPT-6.1 Sol/DevDay, Anthropic's GLM-5.3 report and the White House EO are all dated 29 September — issue #06's publication day, so #06 could not cover them (#06 explicitly deferred DevDay). Each carries a sentence saying so.
- **Verification:** every figure, identifier and date in the report was read from the primary source above on 2026-10-06. Vendor benchmark numbers are labelled self-reported; only the Artificial Analysis rows are independent. The AutomationBench 26.9/50.3 discrepancy and the Fable 5 / GPT-6 Sol DeepSWE comparison are cited to issue #06, not re-read this run.
- **Known gaps:** Vals Index leaderboard URL returned 404, so Google's "leading on Vals Index" claim could not be checked; LMArena not attempted (unreachable in prior runs); no Gulf/MENA item verified to a primary (the UAE funding report is unconfirmed); no funding item traced to a company release or filing.
