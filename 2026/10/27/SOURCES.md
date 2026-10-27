# Sources — Weekly AI Brief #10
**Window covered:** 2026-10-21 to 2026-10-27 (7 days)
**Compiled:** 2026-10-27 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Kimi K3.1 Pro](https://www.kimi.com/en/blog/kimi-k3-1-pro) | Moonshot AI | lab blog | 2026-10-23 | 2026-10-27 | 1M context; "full model weights will be released by Nov 4"; no licence named; self-reported Terminal-Bench 4.0 65.7% (Claude Code harness) vs Opus 5.5 66.4%, Astra 58.2% |
| S2 | [Kimi K3.1 Pro launch benchmarks](https://artificialanalysis.ai/articles/kimi-k3-1-pro-launch-benchmarks) | Artificial Analysis | leaderboard | 2026-10-23 | 2026-10-27 | Index 55, 4th (K3 44); 2.8T total / 104B active; $2/$10/$0.20 per 1M, 33% below K3; Terminal-Bench 4.0 67% (K3 13%, Sonnet 5.5 64%), highest recorded; weights not yet published |
| S3 | [Introducing GPT-6.1 Terra](https://openai.com/index/introducing-gpt-6-1-terra/) | OpenAI | lab blog | 2026-10-26 | 2026-10-27 | `gpt-6.1-terra`; $1 / $0.05 cached / $5 per 1M; 50% below GPT-5.6 Terra and GPT-6.1 Sol; Terminal-Bench 4.0 50.3% (max) vs 21.5%; Critical cyber threshold. Read via `scripts/fetch_openai.py` |
| S4 | [GPT-6.1 Terra pushes the cost-efficiency frontier](https://artificialanalysis.ai/articles/gpt-6-1-terra-pushes-the-cost-efficiency-frontier) | Artificial Analysis | leaderboard | 2026-10-26 | 2026-10-27 | +6 vs GPT-5.6 Terra, −4 vs Sol (max); $0.40 vs $1.40 per index run; hallucination rate 38% vs 88% |
| S5 | [GPT-6.1 Terra](https://artificialanalysis.ai/models/gpt-6-1-terra) | Artificial Analysis | leaderboard | n/a (live page; release 2026-10-26) | 2026-10-27 | Index 48 (max); #25 of 221; 1M context |
| S6 | [Inherited, Not Invented: Tracing the Provenance of Wait in Reasoning Models](https://arxiv.org/abs/2610.30882) | Kou … Guo, HKUST (arXiv:2610.30882) | paper | 2026-10-22 | 2026-10-27 | 18 zero-RL runs, median +42.9 MATH-500, "wait" <0.05/1k in 17/18; ORZ-32B 10.8→91.4%; 13/14 SFT models acquire it; LLM judge 26.0→12.9% vs humans 1.3→15.9%; code public |
| S7 | [Is Complex Agentic Memory Always Needed? Naive RAG Is Stronger Than We Thought](https://arxiv.org/abs/2610.30755) | Bao … Luo (arXiv:2610.30755) | paper | 2026-10-22 | 2026-10-27 | Raw-RAG first in 6/7 settings by 0.13–5.53 points on LoCoMo, LongMemEval, MEME, MemoryAgentBench; coverage explanation; code public |
| S8 | [Eat Your Precision](https://arxiv.org/abs/2610.33512) | Ryu … Yang, KAIST / CMU (arXiv:2610.33512) | paper | 2026-10-24 | 2026-10-27 | Win rate 10.6→68.0% RubricHub-Medical, 22.1→74.1% HealthBench; 9,195→3,533 tokens; Qwen2.5-7B policy; code public |
| S9 | [Ambiguous Fits](https://arxiv.org/abs/2610.34514) | Mlodozeniec, Frei, Google DeepMind (arXiv:2610.34514) | paper | 2026-10-25 | 2026-10-27 | 14×–146× compute disagreement at 300× largest budget; 5^5 grid fits 2–180% above certified minimum; four ladders (HTML v1) |
| S10 | [Models leaderboard](https://artificialanalysis.ai/leaderboards/models) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-27 | v4.3.2; Opus 5.5 58, Sonnet 5.5 56, Wonder Full 56, Kimi K3.1 Pro 55, Fable 5.1 53, Astra 53, Argon 53, Wonder 52, Sol 52, DeepSeek 45, Haiku 5.5 43 |
| S11 | [Vals Index](https://www.vals.ai/benchmarks/vals_index) | Vals AI | leaderboard | updated 2026-10-26 (v2.2) | 2026-10-27 | Sonnet 70.85, Opus 70.18, Argon 69.24, Wonder Full 66.79, Astra 65.02, Wonder 64.88, Sol 63.94, Kimi K3.1 Pro 62.52 ($6.44), DeepSeek 61.26, Terra 60.17 ($2.92), Haiku 58.73 |
| S12 | [ECI scores (CSV)](https://epoch.ai/data/eci_scores.csv) | Epoch AI | leaderboard | re-fitted 2026-10-27 | 2026-10-27 | Opus 168.83 (165.25–173.95), Astra 168.81, Sol 168.37, Fable 166.49, Argon 166.45, Sonnet 166.18, Muse Wonder 161.85 (new), Haiku 159.32 |
| S13 | [Terminal-Bench 4.0](https://www.vals.ai/benchmarks/terminal-bench-4) | Vals AI | leaderboard | updated 2026-10-26 | 2026-10-27 | mini-SWE-agent, avg@3; Opus 65.15, Sonnet 64.14, Kimi 63.64, Astra 59.60, Terra 49.49 |
| S14 | [Red-teaming OpenAI's agent monitoring](https://metr.org/blog/2026-10-22-red-teaming-openai-agent-monitoring/) | METR | press | 2026-10-22 | 2026-10-27 | METR + Redwood employees, 21 Jul–11 Aug; 75–94% eligible, 99.2% Codex; ~10% Codex unmonitored May–Jul, fixed; fixes not evaluated by METR; OpenAI redaction rights |
| S15 | [Anthropic files registration statement](https://www.anthropic.com/news/s1-sec) | Anthropic | press | 2026-10-26 | 2026-10-27 | S-1 filed; Nasdaq Global Select, "ANT"; shares and price range not determined |
| S16 | [Form S-1](https://www.sec.gov/Archives/edgar/data/2130357/000162828026067168/anthropicpbc-sx1.htm) | Anthropic PBC / SEC EDGAR | filing | 2026-10-26 | 2026-10-27 | Revenue $41M/$386M/$4.6B (2023–25), $16.3B H1 2026 (+1,300%); operating loss $693M vs $2.1B; net loss $80.7B incl. fair-value change; ~$245B compute commitments |
| S17 | [Free writing prospectus](https://www.sec.gov/Archives/edgar/data/1326801/000119312526431036/d116268dfwp.htm) | Meta Platforms / SEC EDGAR | filing | 2026-10-26 | 2026-10-27 | ~$35B underwritten ($22.5B Class A + $12.5B convertible preferred); ~$60B ATM after Class C trading; NVIDIA/AMD/Broadcom up to $5.0B; capex $135–145B in 2026 |
| S18 | [Securing our frontier model training environment](https://openai.com/index/securing-our-frontier-model-training-environment/) | OpenAI | lab blog | 2026-10-23 | 2026-10-27 | 20 Sep DNS-resolver misconfiguration incident; no-internet training policy; RL resumed 1 Oct. Read via `scripts/fetch_openai.py` |
| S19 | [Broad access through consistent standards](https://openai.com/index/broad-access-through-consistent-standards/) | OpenAI | lab blog | 2026-10-21 | 2026-10-27 | Usage Policies effective 20 Nov 2026; routers/gateways need review and approval; SafetyIDs. Read via `scripts/fetch_openai.py` |
| S20 | [Migrating to API version 2026-10-21](https://platform.claude.com/docs/en/api/migration-2026-10-21) | Anthropic | documentation | n/a (live page) | 2026-10-27 | temperature/top_p/top_k → 400 even at defaults; document in assistant / citations in user → 400; SDK+CLI Apache 2.0, earlier MIT |
| S21 | [Introducing the AI Biosecurity Lab](https://www.gov.uk/government/news/introducing-the-ai-biosecurity-lab) | UK Government | regulation | 2026-10-24 | 2026-10-27 | £100M government; OpenAI £100M compute and credits; Anthropic up to £100M credits |
| S22 | [Paxton Sues OpenAI and CEO Sam Altman](https://www.texasattorneygeneral.gov/news/releases/attorney-general-ken-paxton-sues-openai-and-ceo-sam-altman-lying-users-and-harming-texans) | Texas Attorney General | press | 2026-10-23 | 2026-10-27 | Suit against OpenAI and Altman under Texas DTPA (page read via curl; WebFetch returned 402) |
| S23 | [DeepSeek-V4.1-Flash-1017 Release](https://api-docs.deepseek.com/news/news261017) | DeepSeek | lab blog | 2026-10-17 | 2026-10-27 | Search and Fetch $0.75 per 1,000 calls per endpoint; billing from 31 Oct 2026 16:00 UTC (forward-looking item) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, in window, but weaker than the selection or cut for space

| Item | URL | Why it did not make the issue |
|---|---|---|
| Ling-3.1-flash-1019 (560B/25B, MIT, AA 44) | https://huggingface.co/inclusionAI/Ling-3.1-flash-1019 | Verified and drafted; cut for the 5-page budget. AA page still says "proprietary" though HF weights are MIT |
| Nemotron 3.5 Bolt E4B shipped 23 Oct (follow-up to #09 watch item) | https://research.nvidia.com/labs/nemotron/NVIDIA-Nemotron-3.5-Bolt-E4B-4GB/ | Verified (Gemma 4 E4B base, 64k, 133.4 tok/s RTX 5070); cut for space; no independent score |
| Cohere: Qwen3.8-Flash-Next exfiltration-like behaviour (26 Oct) | https://cohere.com/blog/concerning-behaviour-popular-open-weight-ai-model | Verified (<1 in 100,000 calls; metadata probe 23–36% under prefill); cut for space; no Alibaba response |
| Recursive Flint 40B-A2.5B (23 Oct) | https://www.recursive.com/updates/introducing-recursive-flint | Self-reported only; context length conflicts between blog and card |
| Nanbeige4.3-33B | https://huggingface.co/Nanbeige/Nanbeige4.3-33B | Self-reported only |
| Atria Dawn (Shanghai AI Lab) | https://huggingface.co/internlm/Atria-Dawn | Self-reported; licence ambiguous |
| OpenAI Decisions API GA (22 Oct) | https://openai.com/index/decisions-api/ | No price on page; space |
| Cohere Rerank 5 (21 Oct) | https://cohere.com/blog/rerank-5 | Self-reported; niche |
| KRAFTON Raon-1 mini preview; HF Carbon-X; IBM Granite Speech 5.0; Tencent Hy-SimulMT; Baidu Unlimited-OCR-2 | https://huggingface.co/KRAFTON/Raon-1-mini-preview | Niche or self-reported only |
| Anthropic donates Agent Skills to the Agentic AI Foundation (22 Oct) | https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation | Space |
| OpenAI models on Google Cloud Model Garden (21 Oct) | https://openai.com/index/openai-models-google-cloud/ | GA "in the coming weeks"; space |
| Gemini API: paid-tier generateContent storage default (26 Oct) | https://ai.google.dev/gemini-api/docs/changelog | Space |
| AA GPT-6.1 Terra Coding Agent Index; Code2Video-AA (26 Oct) | https://artificialanalysis.ai/articles/code2video-aa | Space; Code2Video judge type unstated |
| Papers 2610.29722 (LASAGNA), 2610.31818 (Nestor), 2610.35328 (constrained decoding), 2610.30006 (SAE detectors), 2610.33420 (RL scaling laws), 2610.34654 (Thinking-in-Bets), 2610.31309 (OPTIC), 2610.31943 (looped LMs) | https://arxiv.org/abs/2610.29722 | Verified alternates; cut for space or narrower scope |
| Further papers: 2610.35001, 2610.34915, 2610.31779, 2610.32770, 2610.35518, 2610.29458, 2610.30763 and others | https://arxiv.org/abs/2610.35001 | Niche, single-seed, no numbers in abstract, or no code |
| UK pre-Budget AI package (24 Oct) | https://www.gov.uk/government/news/chancellor-unveils-britains-ambitious-plan-for-ai | Only the Biosecurity Lab line kept, for space |
| Anthropic LTBT appointment (21 Oct) | https://www.anthropic.com/news | Minor |

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| OpenAI 23 Oct API shutdowns (#09 watch item) | https://developers.openai.com/api/docs/deprecations | Page still lists 23 Oct; no changelog entry confirming it happened |
| Gemini 4 Argon GA, Voxtral 3, Timestral, MiniMax M3.1 Flash, MAI-Transcribe-2 | https://ai.google.dev/gemini-api/docs/changelog | All dated before 21 Oct |
| OpenAI acquires Orchestra Bio; Otter.ai $320M; FII10 postponed | https://openai.com/news/rss.xml | Dated 20 Oct or earlier |
| METR review of Anthropic Risk Report | https://metr.org/ | 20 Oct, outside |
| Mistral Large 4 weights | https://mistral.ai/news | Due "end of October"; not yet on HF |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| $63B bank/Blackstone financing for Broadcom chips for Anthropic (26 Oct) | https://wtvbam.com/2026/10/26/wall-street-banks-blackstone-line-up-63-billion-to-finance-broadcom-chips-for-anthropic/ | Reuters via syndication only; Broadcom IR 403 |
| OpenAI up to $30B at $1.25T pre-money (22 Oct) | https://techcrunch.com/2026/10/22/openai-working-on-new-30b-raise-at-1-25t-valuation-ahead-of-ipo/ | CNBC via TechCrunch; terms under negotiation |
| HUMAIN / DataVolt / Nebius 50 MW NEOM framework (21 Oct) | https://baxtel.com/ | Secondary only; non-binding; DCD 403 |
| Flapping Airplanes $1B Series A; Blacksmith $66M | https://techcrunch.com/2026/10/21/year-old-ai-lab-flapping-airplanes-raises-1b-at-a-6b-valuation/ | Secondary only |
| Anthropic IPO trading "as soon as November 16" | https://www.cnn.com/ | Search snippet only (page 451) |
| EU AI Act Art. 75c/75d implementing act feedback deadline 9 Nov | https://ec.europa.eu/info/law/better-regulation/have-your-say | Have Your Say page did not render |
| Qwen3.6 27B (21 Oct) | https://llmgateway.io/timeline | Tracker only; no Qwen primary |
| Grok Voice 3.0 | https://docs.x.ai/docs/release-notes | Month only; x.ai/news 403 |

---

## 3. Method

- **Window:** the seven days ending 2026-10-27, inclusive (21–27 October).
- **Beats swept:**
  - Releases: anthropic.com, Gemini changelog, Meta, Mistral, Qwen, DeepSeek, NVIDIA, Cohere, Moonshot, HF trending and API by creation date, OpenAI via `fetch_openai.py` and news RSS.
  - Research: HF daily papers 21–27 Oct, arXiv cs.CL and cs.LG recent listings, abs and HTML pages for every cited paper.
  - Benchmarks: AA leaderboard, model pages and articles, Vals Index and Terminal-Bench 4.0, Epoch ECI CSV, METR, ARC Prize.
  - Industry/policy: company newsrooms, SEC EDGAR (curl), gov.uk, Texas AG, OpenAI/Anthropic/Gemini deprecation and migration pages.
- **Verification:** every figure, identifier and date in the report was read from the primary source above on 2026-10-27. The lead items (S-1 text, Meta FWP, OpenAI Terra and containment pages, AA Kimi and Terra articles, Vals Index, ECI CSV, arXiv abs pages) were fetched a second time during writing. Vendor numbers are labelled as Moonshot's or OpenAI's own; AA, Vals and Epoch rows are independent.
- **Known gaps:**
  - Unreachable: arena.ai (403), Broadcom IR (403), x.ai/news (403), SWE-bench and LiveBench (JS-only), EU Have Your Say page.
  - Not swept: arXiv cs.AI and cs.CV listings; DeepMind, FAIR and MSR blogs beyond arXiv.
  - Nothing verifiable in window: no SDAIA/KAUST item; the HUMAIN/Nebius NEOM framework is secondary-only. No new BIS export-control rule; no CAC item.
