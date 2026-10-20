# Sources — Weekly AI Brief #09
**Window covered:** 2026-10-14 to 2026-10-20 (7 days)
**Compiled:** 2026-10-20 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Welcome Muse Spark Open](https://huggingface.co/blog/meta-muse-spark-open) | Hugging Face | lab blog | 2026-10-15 | 2026-10-20 | ~816B total / ~42B active; 256 experts, 8 routed; text/image/audio/video in, text out; 1M context; BF16 + NVFP4. HF API: repo gated, licence tag `other` |
| S2 | [Muse Spark Open](https://artificialanalysis.ai/models/muse-spark-open) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-20 | Index 39 (xhigh); 140.4 tok/s; $1.25/$4.25 per 1M tokens |
| S3 | [Welcome Beam: a 501B open model](https://huggingface.co/blog/reflection-beam) | Hugging Face | lab blog | 2026-10-16 | 2026-10-20 | 501B total / 23B active; text-only; 1M context; BF16/FP8/NVFP4; Apache 2.0 |
| S4 | [Beam-1.0-501B-A23B](https://huggingface.co/reflection/Beam-1.0-501B-A23B) | Reflection | model card | 2026-10-16 (weights public) | 2026-10-20 | Self-reported BF16: SWE-bench Verified 81.6%, Terminal Bench v2.1 80.1%, GPQA Diamond 90.6% |
| S5 | [Reflection Beam](https://artificialanalysis.ai/articles/reflection-beam) | Artificial Analysis | leaderboard | 2026-10-16 | 2026-10-20 | Index 30; #2 US open weights behind Muse Spark Open (39); Terminal-Bench 4.0 3.0%; AutomationBench-AA 48.5% |
| S6 | [DeepSeek-V4.1-Flash-1017 Release](https://api-docs.deepseek.com/news/news261017) | DeepSeek | lab blog | 2026-10-17 | 2026-10-20 | "Shorter outputs"; live on web/app/API; Search & Fetch APIs $0.75 per 1,000 calls; harness calls free until billing 31 Oct 16:00 UTC |
| S7 | [DeepSeek-V4.1-Flash-1017](https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017) | DeepSeek | model card | 2026-10-17 | 2026-10-20 | "Minor update"; MIT; 1M context; self-reported HLE 42.6 vs 36.8, Terminal-Bench 4.0 42.3 vs 31.2, DeepSWE v1.1 77.0 vs 74.2 |
| S8 | [DeepSeek V4.1 Flash 1017](https://artificialanalysis.ai/models/deepseek-v4-1-flash-1017) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-20 | Index 45; $0.30/$1.20. Leaderboard FAQ (S15 page): top open weights MiMo-V2.6-Pro 46, DeepSeek 45, GLM-5.3 45 |
| S9 | [Nemotron 3.5 Super VL](https://blogs.nvidia.com/blog/nemotron-3-5-super-vl/) | NVIDIA | lab blog | 2026-10-15 | 2026-10-20 | Super VL and Bolt 74B-A9B 24GB available now; Bolt E4B 4GB "coming Oct. 23" |
| S10 | [NVIDIA Releases Nemotron 3.5 Super and Nemotron 3.5 Bolt](https://artificialanalysis.ai/articles/nemotron-3-5-super-and-bolt) | Artificial Analysis | leaderboard | 2026-10-15 | 2026-10-20 | Super VL 26 (vs Nemotron 3 Super 13); Bolt 21.4; ~630 tok/s at 100k prompts on pre-release endpoint |
| S11 | [More Methods, Better Agents? A Reality Check on Self-Distillation in Agentic RL](https://arxiv.org/abs/2610.19789) | Zhong … Shen (arXiv:2610.19789) | paper | 2026-10-14 | 2026-10-20 | 10 methods vs GRPO, 4 envs, 3 sizes; 132 runs, 12,124.4 H800 GPU-hours, 8 rollout seeds; no method consistently beats GRPO; project page public |
| S12 | [Skip the Compressor](https://arxiv.org/abs/2610.21073) | Yang … Zhai, UIUC (arXiv:2610.21073) | paper | 2026-10-15 | 2026-10-20 | 300 SWE-rebench issues; CQ2-CARE 43.7% (GPT-5.6) / 46.7% (Opus 5); +6.3 vs best compressor; +9.3/+12.7 vs best retriever; beats SweRank, SWE-Pruner. Code "will release" |
| S13 | [What RL Brings to Reasoning](https://arxiv.org/abs/2610.24663) | Zhang … Tang (arXiv:2610.24663) | paper | 2026-10-17 | 2026-10-20 | Qwen3-4B-Base, 120 AIME; ~4% positions recover 90.5% of pass@1 gain; "Alright" 35%; k=256 67.5% vs 61.4% (equal attempts, not compute); code public |
| S14 | [The COUNT](https://arxiv.org/abs/2610.20456) | Magnusson … Koh (arXiv:2610.20456) | paper | 2026-10-14 | 2026-10-20 | Host-memory n-gram counts, no learned params; 1B LMs match +57% compute; training-free domain swap; code at github.com/IanMagnusson/COUNT |
| S15 | [Models leaderboard](https://artificialanalysis.ai/leaderboards/models) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-20 | Opus 5.5 max 58; Sonnet 5.5 max 56; Wonder Full 56; Fable 5.1 53; Astra 53; Argon high 53; Muse Wonder 52; GPT-6.1 Sol 52; DeepSeek V4.1 Flash 1017 45; Haiku 5.5 43. v4.3.2 per Opus 5.5 model page |
| S16 | [Vals Index](https://www.vals.ai/benchmarks/vals_index) | Vals AI | leaderboard | updated 2026-10-19 (v2.2) | 2026-10-20 | Sonnet 5.5 70.85%, Opus 5.5 70.18%, Argon 69.24%, Wonder Full 66.79%, Astra 65.02%, Wonder 64.88%, Sol 63.94% ($3.61), DeepSeek 61.26% ($0.66), Haiku 5.5 58.71%; Fable 5.1 absent; fallback-as-failure Sonnet 69.03%, Opus 64.16%, Argon would lead |
| S17 | [ECI scores (CSV)](https://epoch.ai/data/eci_scores.csv) | Epoch AI | leaderboard | n/a (live data) | 2026-10-20 | Opus 5.5 166.82 (CI 163.54–170.99), Astra 166.41, Sol 166.32, Fable 5.1 164.65, Argon 164.56, Sonnet 5.5 164.45, Haiku 5.5 158.98 |
| S18 | [AA-Robotics v0.1](https://artificialanalysis.ai/articles/aa-robotics) | Artificial Analysis | leaderboard | 2026-10-14 | 2026-10-20 | 6-axis arm, 8 tasks; Astra 69.4, Sol 64.6, Argon 55.3, Opus 5.5 48.8, Fable 5.1 46.3; Astra $16.36/task vs Sol $1.93 |
| S19 | [HealthBench Professional](https://artificialanalysis.ai/articles/healthbench-professional-health-conversations) | Artificial Analysis | leaderboard | 2026-10-19 | 2026-10-20 | 525 clinician conversations; Astra 66.0% length-adjusted; Opus 5.5 raw 71.4% → 59.9%; HealthBench Sonnet 5.5 62.1% |
| S20 | [Tenstorrent Announces a $1.5B Series E at a $6.2B valuation](https://tenstorrent.com/newsroom/tenstorrent-announces-series-e) | Tenstorrent | press | 2026-10-19 | 2026-10-20 | $1.5B at $6.2B post-money; led by Trace Capital and Innovation X; participants; use of funds |
| S21 | [Investing in the public benefit](https://www.anthropic.com/news/public-benefit-fund) | Anthropic | lab blog | 2026-10-18 | 2026-10-20 | 5% subject to stockholder approval; +2% per 50% value rise above baseline; ~20% total incl. 80% founder pledge and employee match; LLC; no lobbying/political giving |
| S22 | [First harmonised standard supporting the AI Act published in the Official Journal](https://digital-strategy.ec.europa.eu/en/library/first-harmonised-standard-supporting-ai-act-published-official-journal) | European Commission | regulation | 2026-10-19 | 2026-10-20 | EN 18286:2026 (CEN/CENELEC); Implementing Decision (EU) 2026/2274; presumption of conformity with Art. 17; more standards to follow |
| S23 | [Key Practices for Incident Readiness and Response in Super Intelligence Training and Evaluation](https://www.nist.gov/news-events/news/2026/10/key-practices-incident-readiness-and-response-super-intelligence-training) | NIST CAISSI, NSA SISC, CISA | regulation | 2026-10-16 | 2026-10-20 | Ten voluntary practices, five stages; scope: uninstructed agent actions compromising operator controls |
| S24 | [Attorney General Brenna Bird Announces Lawsuit against OpenAI](https://www.iowaattorneygeneral.gov/newsroom/attorney-general-brenna-bird-announces-lawsuit-against-openai-for-deceiving-iowa-parents-and-iowans) | Iowa Attorney General | press | 2026-10-14 | 2026-10-20 | Consumer Fraud Act suit; AR, AZ, ID, MT sued separately; KS, NE, WV AGs at press conference |
| S25 | [Deprecations](https://developers.openai.com/api/docs/deprecations) | OpenAI | documentation | n/a (live page; 14 Oct notice) | 2026-10-20 | 23 Oct 2026 shutdowns (gpt-4, gpt-4-turbo, gpt-3.5-turbo, o1, o1-pro, o3-mini, o4-mini, gpt-image-1, fine-tune bases; replacements gpt-5.6-sol/terra); GPT-4o and GPT-4.1 removal 14 Jan 2027 (notified 14 Oct) |
| S26 | [AI Act: regulatory framework](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) | European Commission | regulation | n/a (live page) | 2026-10-20 | Prohibition 9 (non-consensual intimate content / CSAM, "nudification") effective "December 2026", via AI Omnibus (forward-looking item) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, in window, but weaker than the selection or cut for space

| Item | URL | Why it did not make the issue |
|---|---|---|
| Halcyon, T2I without language pretraining (2610.26863) | https://arxiv.org/abs/2610.26863 | Verified and drafted; cut to meet the 5-page budget |
| Epoch, Slay the Spire agents (14 Oct) | https://epoch.ai/publications/ai-systems-are-improving-rapidly-at-slay-the-spire-and-its-sequel | Verified (A20 Heart: Sol 20%, Astra 17%); cut for space |
| Mistral Timestral 5M–209M (15 Oct) | https://mistral.ai/news/timestral/ | Time-series niche; scores partly in images |
| FLUX 3 Image Klein (15 Oct) | https://bfl.ai/blog/flux-3-image-klein | Internal Elo only; non-commercial-style licence |
| NVIDIA Nemotron-Labs-Dory1.0-4B (16 Oct) | https://huggingface.co/nvidia/NVIDIA-Nemotron-Labs-Dory1.0-4B-BF16 | Interesting looped model; self-reported only; space |
| IBM Granite Switch 4.1 (15 Oct) | https://huggingface.co/blog/ibm-granite/granite-switch-4-1 | No benchmark numbers |
| Nemotron-3.5-Rerank-8B | https://huggingface.co/nvidia/Nemotron-3.5-Rerank-8B-BF16 | Card date (20 Oct) disagrees with repo creation (15 Oct); niche |
| Tencent Hy-Memory-30B-A3B | https://huggingface.co/tencent/Hy-Memory-30B-A3B | Benchmarks in figures only |
| OpenAI, low-resource programming languages / MultiLangBench (19 Oct) | https://openai.com/index/low-resource-programming-languages/ | Self-reported vendor eval; space |
| OpenAI Rosalind Academic Plan (15 Oct) | https://openai.com/index/introducing-the-rosalind-academic-plan/ | Access programme, low builder impact |
| Token-Set Choice Confounds POPE (2610.25964) | https://arxiv.org/abs/2610.25964 | Good protocol finding; 4-bit reference; space |
| Policy Is Not Capability (2610.25060) | https://arxiv.org/abs/2610.25060 | No code; space |
| Embeddings Are Overpriced? (2610.22428) | https://arxiv.org/abs/2610.22428 | Single author, one small scale |
| Your Transformer Is Secretly Elastic (2610.20588) | https://arxiv.org/abs/2610.20588 | Vision encoders; space |
| LLM-discovered quantum circuits (2610.22367) + Anthropic blog (16 Oct) | https://arxiv.org/abs/2610.22367 | No code; space |
| OpenGCUA (2610.22200); Argon beats Minecraft (2610.22319); 2610.20865; 2610.22236; 2610.20989; 2610.24671 | https://arxiv.org/abs/2610.22200 | Alternates; single-run or incremental |
| AA-PersonalityBench (19 Oct) | https://artificialanalysis.ai/articles/aa-personalitybench | Style benchmark; lower relevance |
| Vals Terminal-Bench 4.0 refresh (19 Oct) | https://www.vals.ai/benchmarks/terminal-bench-4 | Space; table already uses Vals |
| Epoch open/closed cyber ECI gap (16 Oct) | https://epoch.ai/data-insights/open-closed-cyber-eci-gap | Data as of 8 Oct; space |
| Anthropic independent evaluators update (15 Oct) | https://www.anthropic.com/news/an-update-on-independent-evaluators | Space; went to Public Benefit Fund |
| Anthropic Singapore office + MDDI MOU (14 Oct) | https://www.anthropic.com/news/singapore-office-opening | Space |
| Anthropic midterms safeguards (14 Oct) | https://www.anthropic.com/news/2026-us-midterms | Space |
| Anthropic employment study (16 Oct) | https://www.anthropic.com/research/employment-at-anthropic | Single-company internal data; space |
| UK CST "AI sovereignty" advice (19 Oct) | https://www.gov.uk/government/publications/ai-sovereignty-preserving-uk-agency-in-an-ai-enabled-world | Advice letter written in July, not policy |
| OpenAI EU agentic report (14 Oct) | https://openai.com/index/the-eus-next-chapter-in-ai-is-agentic/ | Vendor usage stats |
| DeepMind × GovTech Singapore scam detection (14 Oct) | https://deepmind.google/blog/on-device-ai-scam-detection-mddi/ | Space |
| Kapital acquires Woz ($30M, 19 Oct) | https://www.prnewswire.com/ | Too minor |
| Gemini API deprecations (22 Oct, 17 Nov) | https://ai.google.dev/gemini-api/docs/deprecations | "Earliest possible" dates; OpenAI shutdown chosen as watch item |
| Claude Sonnet 4.5 retirement 30 Nov | https://platform.claude.com/docs/en/about-claude/model-deprecations | Beyond next week; space |

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| Gemini 4 Argon GA in API and Gemini app | https://ai.google.dev/gemini-api/docs/changelog | 13 Oct, one day before window. Answers #08's watch item: Argon paid API has shipped |
| Gemini 4 Argon safety report | https://blog.google/innovation-and-ai/technology/safety-security/gemini-4-model-safety-security/ | 13 Oct, outside |
| ARC Prize Argon ARC-AGI-3 results | https://arcprize.org/results | 13 Oct, outside; harness discrepancy seen only in a search snippet |
| Apertus 1.5 | https://huggingface.co/blog/swiss-ai/apertus-v15-release-notes | Weights from 24 Jul |
| LFM2.5-24B-A2B, Ling-3.1-flash | https://huggingface.co/LiquidAI | 13 Oct, outside |
| 2610.19095 (Luce's axiom in Arena), 2610.19159 | https://arxiv.org/abs/2610.19095 | v1 13 Oct, outside |
| AA AgentPerf hardware results (15 Oct) | https://artificialanalysis.ai/articles | Hardware throughput, not model evals |
| Canada Regional AI Initiative top-up | https://ised-isde.canada.ca/ | Page last modified 13 Oct |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| Meta's own Muse Spark Open announcement / model card | https://ai.meta.com/blog/ | Not found on about.fb.com or ai.meta.com; card gated. Report sources specs from HF blog and says so |
| OpenAI ~$30B round at >$1.4T | https://gizmodo.com/openai-reportedly-looking-to-hurry-and-get-valued-at-1-4-trillion-before-anthropic-ipo-2000827975 | Reuters/Bloomberg via aggregators only |
| SoftBank up to $100B from Gulf investors | https://www.thestar.com.my/tech/tech-news/2026/10/09/softbank-seeks-up-to-100-billion-from-gulf-investors-for-ai-push-ft-reports | FT only; unconfirmed |
| Anthropic pre-IPO investor day / IPO timing | https://www.anthropic.com/news | Single secondary post; nothing on anthropic.com |
| Amazon >€16B Germany investment (20 Oct) | https://www.handelsblatt.com/technik/it-internet/online-handel-amazon-plant-investitionen-von-rund-16-milliarden-euro/100263514.html | Handelsblatt/dpa only |
| EU consultation on AI Act fining procedures | https://digital-strategy.ec.europa.eu/ | One blog only; no Have Your Say page found |
| UAE–France AI deals (20 Oct) | https://wam.ae/ | Secondary only |
| Microsoft / Nscale Loughton | https://www.nscale.com/ | No company statement |
| Grok Voice 3.0 | https://docs.x.ai/docs/release-notes | Entry undated; x.ai/news 403 |

---

## 3. Method

- **Window:** the seven days ending 2026-10-20, inclusive (14–20 October).
- **Beats swept:**
  - Releases: anthropic.com, blog.google, Gemini changelog, Meta, Mistral, NVIDIA, Microsoft, HF API by org, OpenAI news RSS + `fetch_openai.py`, DeepSeek docs.
  - Research: HF daily papers 14–20 Oct, arXiv cs.CL/cs.LG/cs.AI/cs.CV recent listings, lab research blogs.
  - Benchmarks: AA leaderboard and articles, Vals Index, Epoch ECI CSV and publications, ARC Prize, METR.
  - Industry/policy: company newsrooms, EC digital-strategy, NIST, gov.uk, state AG sites, OpenAI/Google/Anthropic deprecation pages.
- **Verification:** every figure, identifier and date in the report was read from the primary source above on 2026-10-20. The lead releases, arXiv abstracts, AA leaderboard, Vals Index, ECI CSV, and all industry and policy items were re-fetched a second time when the issue was written. During that pass, a draft claim that DeepSeek had the top open-weight AA score was corrected: MiMo-V2.6-Pro scores 46. Vendor benchmark numbers are labelled self-reported; AA, Vals and Epoch rows are independent.
- **Known gaps:**
  - Unreachable: Meta's own Muse Spark Open post and model card were not reachable. x.ai/news, humain.com, dojmt.gov and thehill.com returned 403, and EUR-Lex returned an empty page, so the 14 Oct Official Journal date for EN 18286 is unconfirmed (the report uses the Commission's 19 Oct page).
  - Not swept: lmarena/arena.ai, SWE-bench, LiveBench and Scale SEAL. DeepMind and MSR posts were seen in RSS only.
  - Nothing verifiable in window: no Saudi Arabia (SDAIA/KAUST/HUMAIN) or China (CAC) item, and no new US export-control rule.
