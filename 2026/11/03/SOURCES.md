# Sources — Weekly AI Brief #11
**Window covered:** 2026-10-28 to 2026-11-03 (7 days)
**Compiled:** 2026-11-03 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Introducing Gemini 4 Carbon](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/) | Google | lab blog | 2026-10-28 | 2026-11-03 | Access to "a subset of cyber defenders", Fairwind Program; $2/$10 intro then $4/$20 per 1M; self-reported SEC-bench Pro 88.2%, ExploitGym 54.8%, CWE-bench 71.0% |
| S2 | [Gemini 4 Carbon is the new #1](https://artificialanalysis.ai/articles/gemini-4-carbon-new-number-1) | Artificial Analysis | leaderboard | 2026-10-28 | 2026-11-03 | Index v5 59; Terminal-Bench 4.0 64% (2nd to Opus); hallucination 11% vs 50% Opus/Astra; $7.76 per index task, ~23% below Opus ($10.04) |
| S3 | [Mistral Large 4 open weights](https://mistral.ai/news/mistral-large-4-oss/) | Mistral AI | lab blog | n/a on page (weights 2026-10-29) | 2026-11-03 | $0.70/$0.07/$2.10 per 1M; self-reported Terminal-Bench 4.0 41% (+13 vs preview); BrowseComp 84.5% |
| S4 | [Mistral-Large-4-1T-A52B](https://huggingface.co/mistralai/Mistral-Large-4-1T-A52B) | Mistral AI / Hugging Face | model card | 2026-10-29 ("Initial release" commit 14:11 UTC) | 2026-11-03 | ~1T total, 49B active (52B incl. embeddings/output); 1M context; Mistral Ecosystem Open-Weight License (modified MIT; MaaS needs separate commercial licence) |
| S5 | [Mistral Large 4](https://artificialanalysis.ai/models/mistral-large-4) | Artificial Analysis | leaderboard | n/a (live page) | 2026-11-03 | Index v5 26 (high); open weights |
| S6 | [bf16 Rounding Silently Discards Most RL Policy Updates](https://arxiv.org/abs/2610.41073) | Gao, Gao, Stanford (arXiv:2610.41073) | paper | 2026-10-29 | 2026-11-03 | 0.4–0.5% of served weights change/step on Qwen3-1.7B; 50–150-step lag; Fair Cast one line, 22–38 ms; 18/6/1 of 25 seed pairs, +6.1 mean; code public |
| S7 | [There Is No Free Loop](https://arxiv.org/abs/2610.42030) | Sukthanker, Cameron, Microsoft (arXiv:2610.42030) | paper | 2026-10-30 | 2026-11-03 | Qwen3/3.5 0.8B–9B; only looped 0.8B beats both baselines; 9B up to 13 points over 4B |
| S8 | [Simple Features Beat Most AI Control Monitors](https://arxiv.org/abs/2610.41713) | Debsarkar (UVA), Nahata (UCSD) (arXiv:2610.41713) | paper | 2026-10-30 | 2026-11-03 | Outranks 20 of 24 open-weight monitors; 1 in 7 backdoors invalid; Sonnet 5 monitor 77% vs 37%, 78% vs 61% verified; dataset released |
| S9 | [Delivered, Not Used](https://arxiv.org/abs/2611.01718) | Xu, Li, Xu, CUHK (arXiv:2611.01718) | paper | 2026-11-01 | 2026-11-03 | 8,000 SWE-bench Verified episodes, three memory systems, within 0.4 pp of no-memory baseline |
| S10 | [Progress on provable inference for large language models](https://www.anthropic.com/research/provable-inference) | Anthropic Frontier Red Team, EPFL et al. | lab blog | 2026-11-02 | 2026-11-03 | FlashProve: Llama 4 Maverick 4-bit, ~110 tok/s on one H100, ~18.78 MB proof, ~17 s verify, ~72x vLLM; VerInf ~0.02 tok/s; greedy, ≤1,024 tokens; Apache 2.0 |
| S11 | [Announcing Artificial Analysis Intelligence Index v5](https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v5) | Artificial Analysis | leaderboard | 2026-10-27 | 2026-11-03 | 9 evals in 4 groups at 25%; 60% private/held-out; best released open weights 32 (DeepSeek V4.1 Flash 1017, GLM-5.3); no comparability statement vs v4 |
| S12 | [Models leaderboard](https://artificialanalysis.ai/leaderboards/models) | Artificial Analysis | leaderboard | n/a (live page) | 2026-11-03 | v5 scores: Carbon 59, Opus 58, Astra 57, Sol 55, Sonnet 54, Terra 51, Argon 50, Wonder Full 50, Fable 49, Kimi 46, Wonder 43, Haiku 36, DeepSeek 32, Mistral Large 4 (high) 26 |
| S13 | [Vals Index](https://www.vals.ai/benchmarks/vals_index) | Vals AI | leaderboard | updated 2026-10-30 (v2.2) | 2026-11-03 | Sonnet 70.85, Carbon 70.45 (new), Opus 70.18, Argon 69.24, Wonder Full 66.79, Astra 65.02, Wonder 64.88, Sol 63.94, Kimi 62.52, DeepSeek 61.26, Terra 60.54 (was 60.17), Haiku 58.73, Mistral Large 4 56.53 (17th) |
| S14 | [ECI scores (CSV)](https://epoch.ai/data/eci_scores.csv) | Epoch AI | leaderboard | n/a (re-fitted since 2026-10-27) | 2026-11-03 | Astra 169.06 (165.88–174.29), Opus 168.40, Terra 168.11, Sol 167.82, Sonnet 166.74, Fable 166.36, Argon 166.07, Wonder 161.71, Haiku 160.37, DeepSeek 1017 158.83, Mistral Large 4 150.59 |
| S15 | [AI can turn security fixes into working exploits before users receive an update](https://epoch.ai/publications/open-weight-models-patch-gap) | Epoch AI | press | 2026-10-29 | 2026-11-03 | GLM 5.3, no internet, ≤48 h; Firefox 156.0–158.0.1 file-read exploits, fastest ~12 h, ~$1,000/version, >$100k total; Chrome none from ~$100k; no refusals; fixed in 159.0 |
| S16 | [Form S-1/A (Amendment No. 1)](https://www.sec.gov/Archives/edgar/data/2130357/000162828026068676/anthropicpbc-sx1ax1.htm) | Anthropic PBC / SEC EDGAR | filing | 2026-11-02 | 2026-11-03 | Q3 revenue $17.0B, +1,127% YoY; compute +382%; 9M revenue $33,242M vs $2,545M; Q3 op loss $567M ($5.0B short-term compute); adj. op income $2.5B, 15%; commitments ~$895.4B, $447.5B before 2031; price range blank; RSP "imminently meet" and "fully autonomously design" quotes |
| S17 | [How we detect frontier model misalignment](https://openai.com/index/how-we-detect-frontier-model-misalignment/) | OpenAI | lab blog | 2026-10-29 | 2026-11-03 | Hugging Face incident began in unmonitored cyber evals; replay alerts ~30 min after escape, >30 h before breach; quarantine and encrypted weights; coverage incl. some external; Chat Completions not covered. Read via `scripts/fetch_openai.py` |
| S18 | [Marvell and Lumentum to combine](https://investor.marvell.com/news-events/press-releases/detail/1040/marvell-and-lumentum-to-combine-creating-a-category-leader-in-ai-connectivity) | Marvell Technology | press | 2026-11-02 | 2026-11-03 | $115B EV; 4.500 shares (~$1,132); 23.9% premium; close H1 2028 |
| S19 | [Budget 2026 speech](https://www.gov.uk/government/speeches/budget-2026-speech) | HM Treasury / UK Government | regulation | 2026-10-28 | 2026-11-03 | Extra £0.5bn AI safety and security; £140m Sovereign AI Unit; British Data Centre Covenant (grid connections, on-site generation) |
| S20 | [Gemini API changelog](https://aistudio.google.com/docs/changelog) | Google | documentation | entries 2026-10-30, 2026-11-02 | 2026-11-03 | Gemini 2.5 Pro → 3.8 Flash, 2.5 Flash → 3.5 Flash-Lite from 1 Dec, new rates; breaking changes (thinking_level, sampling params, prefill) |
| S21 | [Kimi K3.1 Pro](https://www.kimi.com/en/blog/kimi-k3-1-pro) | Moonshot AI | lab blog | 2026-10-23 | 2026-11-03 | Still "weights will be released by Nov 4"; no licence; HF API for `moonshotai` newest is Kimi-K3 (2026-06-13) |
| S22 | [Usage Policy update](https://www.anthropic.com/news/2026-usage-policy-update) | Anthropic | lab blog | 2026-10-08 (effective 12 Nov) | 2026-11-03 | "hold a safe state"; may not "decide or recommend who to investigate, arrest, or charge"; unsupported-regions enforcement (forward-looking item) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, in window, but weaker than the selection or cut for space

| Item | URL | Why it did not make the issue |
|---|---|---|
| Mage-VL-Cowork 4B, Apache 2.0, OSWorld-Verified 66.0% (30 Oct) | https://huggingface.co/microsoft/Mage-VL-Cowork | Verified and drafted; cut for the 5-page budget; self-reported only |
| When 200 OK Is Not an Answer (arXiv:2611.00884, 31 Oct) | https://arxiv.org/abs/2611.00884 | Verified and drafted (20.9% of 200s lack content); cut for space; data/code not yet released |
| Gemini API Computer Use GA (30 Oct) | https://aistudio.google.com/docs/changelog | No price; space |
| Particle-1 (DeepSeek V4.1 Flash LoRA, 28 Oct) | https://particle.ai/blog/introducing-particle-1 | Self-reported; prices conflict across docs/OpenRouter/Vercel |
| GitHub Copilot Fusion GA (28 Oct) | https://github.blog/changelog/2026-10-28-route-and-orchestrate-models-with-github-copilot-fusion | AA Coding Agent Index 60 relayed by GitHub, AA article not opened |
| SenseNova-Loop-9B-Preview (28–30 Oct) | https://huggingface.co/sensenova/SenseNova-Loop-9B-Preview | Benchmarks in images only; tech report "TBD" |
| NVIDIA DeepSeek-V4.1-Flash-1017-NVFP4 (30 Oct) | https://huggingface.co/nvidia/DeepSeek-V4.1-Flash-1017-NVFP4 | Quantised re-release; minor |
| Papers 2611.01313 (fake citations), 2610.39302 (JEPA/Platonic, Balestriero & LeCun), 2610.38691 (misattributed numbers), 2610.40939 (CoT controllability), 2610.41574 (BYOD) | https://arxiv.org/abs/2611.01313 | Verified alternates; cut for space |
| Papers 2610.38433, 2610.40945, 2610.39295, 2611.00883, 2610.38174, 2610.40738, 2611.01484, 2610.40287, 2611.01927 | https://arxiv.org/abs/2610.40945 | Narrower scope, theory-only, self-reported, or no numbers in abstract |
| Vals Terminal-Bench 4.0 update (29 Oct; Carbon 63.13%) | https://www.vals.ai/benchmarks/terminal-bench-4 | Space |
| Epoch data insights: compute capacity doubling ~9 months; bioRxiv LLM acknowledgements | https://epoch.ai/ | Not model evaluations; space |
| Hyperscaler Q3 results: Microsoft, Alphabet, Amazon 8-K exhibits (28–29 Oct) | https://www.sec.gov/Archives/edgar/data/1652044/000165204426000080/googexhibit991q32026.htm | Read by the harvest; cut for space |
| OpenAI bug bounty increase, security sprint, Grid Protectors Program, robots.txt AI-preference signal, Model Spec update, teen protections (29 Oct–2 Nov) | https://openai.com/index/rewarding-defenders-with-bigger-bug-bounties | Space; lower consequence for builders |
| Anthropic AI for Science expansion (28 Oct) | https://www.anthropic.com/news/ai-for-science-expands-foundations-research-institutions | No figures |
| KAUST 13th Saudi HPC/AI Conference (26–28 Oct) | https://www.kaust.edu.sa/news/kaust-hosts-the-13th-saudi-hpc-ai-conference | Started before window; no figures |

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| DeepSeek Search/Fetch billing (31 Oct 16:00 UTC, #10 watch item) | https://api-docs.deepseek.com/quick_start/pricing | Pages still say "currently free"; could not confirm billing started |
| Kimi K3.1 Pro weights (#10 watch item) | https://huggingface.co/api/models?author=moonshotai | Not released as of 3 Nov; carried to watch list |
| AA v5 article (27 Oct) | https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v5 | One day before window; cited only as the method change behind this week's table |
| Papers 2610.34073, 2610.34491, 2610.37386, 2610.37364, 2610.35962, 2610.37481, 2610.37255, 2610.34298 | https://arxiv.org/abs/2610.37386 | v1 dated 25–27 Oct, outside window |
| Gemini API CLI beta; qwen-audio-3.1-realtime-flash | https://aistudio.google.com/docs/changelog | Dated 27 Oct |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| Anthropic IPO valuation $1.5–1.6T, roadshow "as early as next week" (WSJ) | https://fortune.com/2026/11/03/anthropics-third-quarter-results-mean-ipo-math-and-history-are-not-on-its-side-analysts-say/ | Secondary only; S-1/A price range blank |
| Anthropic expected "high junk" rating (FT) | https://techcrunch.com/2026/10/30/anthropic-expected-to-receive-high-junk-rating-from-credit-agencies-following-ipo-report-says/ | Secondary only |
| OpenAI cuts raise target $30B → $20B (FT/WSJ) | https://techcrunch.com/2026/10/31/openai-reportedly-lowers-funding-target-for-new-round/ | Secondary only; unnamed sources |
| OpenAI–ADNOC–G42 agreements, Abu Dhabi (2 Nov) | https://www.thenationalnews.com/business/energy/2026/11/02/adnoc-signs-agreement-with-openai-and-g42-to-deploy-frontier-ai/ | ADNOC 403; not on OpenAI RSS; no value disclosed |
| Drax/Brookfield/Radiant >1 GW data centre (3 Nov) | https://www.resultsense.com/news/2026-11-03-drax-brookfield-radiant-yorkshire-data-centre/ | Reuters via syndication; drax.com stale |
| NYT and Tribune papers sue Brave (2 Nov) | https://techcrunch.com/2026/11/02/new-york-times-and-other-outlets-sue-web-browser-brave-over-alleged-content-scraping/ | Secondary only; complaint not fetched |
| EU AI Act Art. 75c/75d feedback closes 9 Nov | https://euagenda.eu/events/2026/11/09/ai-act-implementing-act-articles-75c-75d-draft-act | Commission page not reached |
| DeepSeek V4.1 Flash Cyber | https://llmgateway.io/models/deepseek-v4.1-flash-cyber | Gateway listing only |

---

## 3. Method

- **Window:** the seven days ending 2026-11-03, inclusive (28 October – 3 November).
- **Beats swept:**
  - Releases: Google blog and Gemini changelog, Mistral, HF API by creation date (moonshotai, mistralai, microsoft, nvidia, others), DeepSeek docs, Anthropic news, OpenAI via news RSS and `fetch_openai.py`, docs.x.ai, ai.meta.com, AI2.
  - Research: HF daily papers 28 Oct–3 Nov, arXiv cs.CL/cs.LG/cs.AI recent listings, abs pages for every cited paper (re-read by curl at writing time), Anthropic research.
  - Benchmarks: AA leaderboard, v5 article and model pages, Vals Index and Terminal-Bench 4.0, Epoch ECI CSV and publications, METR, ARC Prize.
  - Industry/policy: SEC EDGAR (curl with UA), company newsrooms, gov.uk, EU digital-strategy, BIS, Federal Register, Gulf sources.
- **Verification:** every figure, identifier and date in the report was read from the primary above on 2026-11-03. The S-1/A was downloaded and searched for each quoted figure and sentence; the OpenAI, Google, AA, Mistral, Marvell, gov.uk, Epoch, Vals and arXiv pages were re-fetched during writing. Vendor numbers are labelled as the vendor's own; AA, Vals and Epoch figures are independent.
- **Known gaps:**
  - Unreachable: arena.ai (403), x.ai/news, adnoc.ae (403), spa.gov.sa (empty), EU Have Your Say, SWE-bench/LiveBench (client-side), Meta Q3 earnings release.
  - Not swept: arXiv cs.CV; FAIR and MSR blogs; DeepMind blog dates are month-only.
  - Nothing verifiable in window from SDAIA, HUMAIN, CAC or BIS; the one Gulf item (OpenAI–ADNOC) is secondary only.
