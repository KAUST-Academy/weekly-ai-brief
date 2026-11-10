# Sources — Weekly AI Brief #12
**Window covered:** 2026-11-04 to 2026-11-10 (7 days)
**Compiled:** 2026-11-10 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Introducing Claude Fable 5.2 and Claude Mythos 5.2](https://www.anthropic.com/claude-fable-and-mythos-5-2) | Anthropic | lab blog | 2026-11-09 | 2026-11-10 | "same underlying model"; classifiers fall back to Opus 4.8 (cyber) / Opus 5 (biology); Mythos via verification programmes; $8/$40, fast mode $16/$80, up to 2.5x; self-reported FrontierCode 2.0 49.1% (Xhigh) vs Opus 5.5 45.5%, FrontierSWE v2 69.9%, HLE with tools 74.2%; ~55% fewer blocks vs Fable 5.1; "took steps to limit advances" in AI-R&D skills (kernel optimisation, LLM architectures) at about Opus 5.5 level; Opus 5.5 recommended as default |
| S2 | [Models leaderboard](https://artificialanalysis.ai/leaderboards/models) | Artificial Analysis | leaderboard | n/a (live page) | 2026-11-10 | Index scores: Fable 5.2 (max) 64.56, Carbon (high) 60.03, Opus 5.5 (max) 59.11, Astra (max) 56.85, Sol (max) 54.61, Sonnet 5.5 (max) 54.54, Terra (max) 51.33, Argon (high) 50.41, Wonder Full (max) 50.08, Kimi K3.1 Pro 46.45, Wonder (max) 43.57, Haiku 5.5 (max) 36.48, Muse Ember (max) 36.02, DeepSeek V4.1 Flash 1017 (max) 32.59, Mistral Large 4 (high) 26.12; Kimi top `isOpenWeights` entry (next DeepSeek 32.59); no Fable 5.1 score row; no GPT-6 Cyber |
| S3 | [GPT-6 Cyber: Advancing the frontier of aligned cybersecurity agents](https://openai.com/index/introducing-gpt-6-cyber/) | OpenAI | lab blog | 2026-11-05 | 2026-11-10 | ExploitGym 48.5% vs 32.1% (GPT-5.6 Cyber); web pentest recall 40.3% vs 32.0% (Astra); ExploitGym Honeypot 99.93% / 100%; "Critical in cybersecurity under our Preparedness Framework, up from High"; select Daybreak Red customers via API and Codex; IP allowlisting by default; no price. Read via `scripts/fetch_openai.py` |
| S4 | [A thousand fewer paths to root](https://openai.com/index/a-thousand-fewer-paths-to-root/) | OpenAI | lab blog | 2026-11-04 | 2026-11-10 | Mid-October scan; 2,308 candidates, 1,724 reproduced, 948 LPE exploits; $1,213,430 API credits, $1,279 per LPE exploit; after 10 days 61 patched upstream, 43 staging. Read via `scripts/fetch_openai.py` |
| S5 | [Kimi-K3.1-Pro model card and licence](https://huggingface.co/moonshotai/Kimi-K3.1-Pro) | Moonshot AI / Hugging Face | model card | public by 2026-11-04 (first discussion 15:46 UTC; repo createdAt 2026-11-02, not public on 2026-11-03) | 2026-11-10 | 2.8T total / 104B active; 1M context; MXFP4 weights / MXFP8 activations; Kimi K3.1 Pro License: MaaS > $20M revenue in 12 months needs agreement, > 100M MAU or > $20M monthly revenue must display name; self-reported Terminal-Bench 4.0 65.7 (Claude Code harness) |
| S6 | [Terminal-Bench 4.0](https://www.vals.ai/benchmarks/terminal-bench-4) | Vals AI | leaderboard | updated 2026-11-09 | 2026-11-10 | mini-swe-agent, 66 tasks, 8-hour limit, mean of 3 runs; Fable 5.2 65.15%, Opus 5.5 65.15%, Kimi K3.1 Pro 63.64%, Carbon 63.13%, Astra 59.60% |
| S7 | [Alignment Investigation of Mythos 5's behaviour in UK AISI's July 2026 Security Incident](https://arxiv.org/abs/2611.10030) | Järviniemi, Souly, D'Cruz, Taylor, Davies, Kirk, UK AISI (arXiv:2611.10030) | paper | 2026-11-05 | 2026-11-10 | Incident behaviour (malicious change, fake accounts, prompt injection); payload delivery in simulated replications: Mythos 5 60%, Astra 32%, Opus 4.8 8%, GPT-5.6 Sol 7%, Opus 5 1%, Mythos 5.1 0.3%, Opus 5.5 and GPT-5.5 0%; invalid "simulated" justifications; transcripts shared with METR (abstract + HTML v1) |
| S8 | [Don't Blame The Preferences: Examining The Emergence of Sycophancy in LLM Training](https://arxiv.org/abs/2611.10045) | Yang, Zehr, Bijith, Fain, Duke / Yale (arXiv:2611.10045) | paper | 2026-11-05 | 2026-11-10 | 9 combinations; SFT ≥ 92% of preference-aligned and ≥ 85% of final sycophancy; preference alignment raises it in 4 of 9, by 4.2 pp; highest-scoring datasets from SFT |
| S9 | [Unpacking the Compute Efficiency of Strong-to-Weak OPD against GRPO](https://arxiv.org/abs/2611.08453) | Liu, Li, Pang et al., Salesforce AI Research (arXiv:2611.08453) | paper | 2026-11-05 | 2026-11-10 | External teacher "generally loses"; own GRPO checkpoint as teacher 50x fewer FLOPs; distillation 5.2% / 8.0% of specialist FLOPs; 42.0% fewer total FLOPs on 2-domain mix |
| S10 | [The Surprising Effectiveness of Deleting Weights in LLM Post-Training](https://arxiv.org/abs/2611.10866) | Lu, Yang, Lasby, Pote, Ioannou, Ren, NYU / Calgary (arXiv:2611.10866) | paper | 2026-11-07 | 2026-11-10 | < 0.05% of weights zeroed matches FFT across RLVR, SFT, OPD; mask "hundreds to thousands of times smaller"; others lose up to 5.4 points |
| S11 | [Intelligence Benchmarking Methodology](https://artificialanalysis.ai/methodology/intelligence-benchmarking) | Artificial Analysis | documentation | v5.0.1 "November 2026 to current" | 2026-11-10 | v5.0.1 "regraded all models on CritPt v2"; index labelled v5.0.1 |
| S12 | [Vals Index](https://www.vals.ai/benchmarks/vals_index) | Vals AI | leaderboard | updated 2026-11-09 (v2.2) | 2026-11-10 | Fable 5.2 71.31% (new), Sonnet 5.5 70.85, Carbon 70.45, Opus 5.5 70.14 (was 70.18), Argon 69.39 (was 69.24), Wonder Full 66.79, Astra 65.02, Wonder 64.88, Sol 63.94, Kimi 62.52, DeepSeek 61.26, Terra 60.54, Muse Ember 60.48 (new), Haiku 58.73, Mistral Large 4 56.53 |
| S13 | [ECI scores (CSV)](https://epoch.ai/data/eci_scores.csv) | Epoch AI | leaderboard | n/a (new row dated 2026-11-09) | 2026-11-10 | Fable 5.2 174.24 (170.12–178.79), Astra 169.16 (166.19–172.51), Sol 168.87, Opus 5.5 168.67, Terra 168.11, Argon 166.53, Sonnet 5.5 166.32, Kimi K3.1 Pro 162.02 (new row), Wonder 162.01, Haiku 160.25, DeepSeek 1017 159.34, Mistral Large 4 154.59 |
| S14 | [Updating the Epoch Capabilities Index methodology to use a Bayesian model](https://epoch.ai/publications/eci-bayesian-methodology) | Epoch AI (Álvarez, Barry) | press | 2026-11-04 | 2026-11-10 | 176 models ≥ ECI 125 agree closely, 1.1 RMSE; 76 models below 125 move down 13.7 points on average |
| S15 | [Review of the "Risks from automated R&D" section in Anthropic's Risk Report (August 2026)](https://metr.org/blog/2026-11-05-rd-section-anthropic-risk-report-august-2026-review/) | METR | press | 2026-11-05 | 2026-11-10 | Public "less than a factor of 2" vs implied 1.97; METR range 1.3–2.8; "plausible" threshold crossed; "overall understates the level of acceleration"; Anthropic redaction rights |
| S16 | [Form S-1/A (Amendment No. 2)](https://www.sec.gov/Archives/edgar/data/2130357/000162828026072484/anthropicpbc-sx1ax2.htm) | Anthropic PBC / SEC EDGAR | filing | 2026-11-10 | 2026-11-10 | $70.00–78.00; 825,000,000 shares (801,351,354 + 23,648,646); option 123,750,000; Nasdaq "ANT"; $26.0B private placement (Google, NVIDIA ~$10.0B each; AMD $2.5B; Broadcom, Micron, Microsoft $1.0B each; TSMC $500M); net proceeds ~$84.6B at $74; Run-Rate Revenue ~$81B at 2026-10-31, +$10B vs 2026-09-30; commitments ~$900.9B; 13,086,672,593 shares outstanding post-offering (valuation arithmetic is ours); delivery date blank |
| S17 | [Statement From NVIDIA Board of Directors](https://nvidianews.nvidia.com/news/statement-from-nvidia-board-of-directors) | NVIDIA | press | 2026-11-08 | 2026-11-10 | Independent investigation; committee of independent directors with outside counsel; "no reason to believe…compromised"; confidence in Huang |
| S18 | [Extension of the Suspension of Expansion of End-User Controls for Affiliates of Certain Listed Entities](https://www.federalregister.gov/documents/2026/11/09/2026-22793) | Bureau of Industry and Security / Federal Register | regulation | 2026-11-09 (91 FR 70789, effective same day) | 2026-11-10 | Suspension was set to end 2026-11-09; extended through 2027-01-10 (read via the Federal Register API) |
| S19 | [HUMAIN Secures $667 Million Infra Financing to Advance Saudi Arabia's AI Infrastructure](https://english.aawsat.com/business/5339534-humain-secures-667-million-infra-financing-advance-saudi-arabia%E2%80%99s-ai) | Asharq Al-Awsat (SPA wire) | press | 2026-11-10 (signed Monday 2026-11-09) | 2026-11-10 | Up to SAR 2.5bn ($667M); GPU facility SAR 1.1bn, ~25 MW; grid facility SAR 1.4bn, up to 1 GW; first deals under Infra's AI Data Center Financing Program; builds on non-binding SAR 4.5bn January framework. Secondary (wire) — humain.com 403, spa.gov.sa empty |
| S20 | [Introducing Inkling 2 Small](https://thinkingmachines.ai/news/inkling-2-small/) | Thinking Machines Lab | lab blog | 2026-11-05 | 2026-11-10 | 594B total / 17B active; AA score 31 (lab's claim; AA leaderboard 30.63); weights under Apache 2.0 "next week" after external safety testing (watch item) |
| S21 | [Tencent Launches Hy4](https://www.tencent.com/tencent-launches-hy4-joining-the-ranks-of-the-worlds-leading-open-source-ai-models/) | Tencent | press | 2026-11-04 | 2026-11-10 | Weights and system cards "in the coming days"; ~$0.90 / $2.70 / $0.045 per 1M tokens (watch item) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, in window, but weaker than the selection or cut for space

| Item | URL | Why it did not make the issue |
|---|---|---|
| Muse Ember entry (Meta; $0.10/$0.50, AA 36) | https://dev.meta.ai/resources/blog/build-with-muse-ember | Verified and drafted; cut for the 5-page budget. Kept as a row in the benchmark table. Meta's page is undated; OpenRouter lists it from 2026-11-09 |
| How Much Is Left Matters (arXiv:2611.10307, 6 Nov) | https://arxiv.org/abs/2611.10307 | Verified and drafted (31.5% vs 5.5% flags; 6.2% on AIME 2026); cut for space; single author, maths only |
| OpenAI Control Room (9 Nov) | https://openai.com/index/control-room/ | Read and drafted (35-second halt, safety case per agentic job); cut for space |
| OpenAI BioBasicsBench (6 Nov) | https://openai.com/index/measuring-how-ai-agents-handle-wet-lab-science/ | Read; GPT-6 Astra 66.7% vs GPT-5.6 Sol 43.8% at xhigh; OpenAI models only, no release of the benchmark found |
| OpenAI Images 2.6 (4 Nov) | https://openai.com/index/introducing-images-2-6/ | Read; no prices on the page; lower consequence |
| OpenAI to acquire Pierre (4 Nov) | https://openai.com/index/openai-to-acquire-pierre/ | Read; no terms disclosed |
| OpenAI National Community Compact / Compute Campus Policy Blueprint (5 Nov) | https://openai.com/index/setting-new-standard-responsible-ai-infrastructure/ | Read; voluntary commitments and policy proposals; space |
| DOJ Super Intelligence Task Force (5 Nov) | https://www.justice.gov/opa/pr/department-justice-launches-super-intelligence-task-force | Primary read; no budget or powers stated; lower consequence for builders |
| Benchmarks as Software / Terminal-Bench 2.1 audit (arXiv:2611.08417, 5 Nov) | https://arxiv.org/abs/2611.08417 | Verified; TB 2.1 already in use since issue #02; space |
| FP4 pretraining slows rare facts (arXiv:2611.12832, 9 Nov) | https://arxiv.org/abs/2611.12832 | Verified; 12M–100M-parameter models, emulated FP4 |
| Parallel agent teams (arXiv:2611.09798, 6 Nov) | https://arxiv.org/abs/2611.09798 | Verified; code released; space |
| Papers 2611.09828, 2611.07756, 2611.10240, 2611.06372, 2611.12675, 2611.11450, 2611.06324, 2611.10719, 2611.06425, 2611.06629, 2611.10620, 2611.10334, 2611.06977 | https://arxiv.org/abs/2611.09828 | Abstracts read in the harvest; narrower scope or weaker transfer; not re-verified for writing |
| AA VIALS-AA (6 Nov), Decision Index v2 (8 Nov), Inkling 2 Small and Nanbeige4.3 evaluations (5 Nov) | https://artificialanalysis.ai/articles/vials-aa | Read in the harvest; space |
| Vals CyberBench v1.1 (updated 5 Nov); Vals Inkling profanity note (6 Nov) | https://www.vals.ai/benchmarks/cyber | Launch date of v1.1 unclear; the note is minor |
| Irregular, Assessing GPT-6 Cyber (5 Nov) | https://irregular.com/research/assessing-gpt-6-cyber-against-offensive-security-benchmarks | Done "with OpenAI", so not independent; setup unstated |
| Scale Remote Labor Index (Fable 5.2 41.30) | https://labs.scale.com/leaderboard/rli | Page undated; unclear who ran the Fable 5.2 entry |
| LongCat-2.5 (Meituan, HF 4 Nov, MIT, 1.6T) | https://huggingface.co/meituan-longcat/LongCat-2.5 | Self-reported only; space |
| Ripple-65B Preview (Ricursive, Apache 2.0) | https://huggingface.co/ricursiveAI/Ripple-65B-Preview | Self-reported only; launch page undated |
| Arete-27B (Nous Research, 6 Nov) | https://huggingface.co/NousResearch/Arete-27B | Narrow fine-tune |
| Gemini Omni 1.2 Flash GA (5 Nov) | https://blog.google/innovation-and-ai/technology/developers-tools/introducing-gemini-omni-1-2-flash/ | Video model; changelog prices only readable through a summary |
| AlphaProof Code (DeepMind, 10 Nov) | https://deepmind.google/blog/introducing-alphaproof-code/ | Research framework; not re-verified for writing |
| NVIDIA Cosmos 3 Nano interactive; Mistral Studio expansion | https://huggingface.co/blog/nvidia/cosmos-interactive-world-simulation | Repos created in August / no figures |
| Five9–Level AI (~$325M, 8-K, 5 Nov) | https://www.sec.gov/Archives/edgar/data/1288847/000128884726000141/projectlanderpressreleas.htm | Minor acquisition |

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| Anthropic Usage Policy (#11 watch item, effective 12 Nov) | https://www.anthropic.com/news/2026-usage-policy-update | No change since issue #11 |
| OpenAI–ADNOC–G42 (#11 "not verifiable") | — (exact URL not recorded by the harvest) | ADNOC release dated 2 Nov, before window; no terms; nothing new |
| UK Cyber Security and Resilience Bill agentic-AI factsheet | https://www.gov.uk/government/publications/cyber-security-and-resilience-network-and-information-systems-bill-factsheets/agentic-ai-resilience-measures | Last updated 3 Nov, before window |
| Aramco 49% HUMAIN stake; CNTXT joins HUMAIN | — (exact URL not recorded by the harvest) | 1 and 3 Nov, before window |
| Papers 2611.05358, 2611.05590, 2611.05609 | https://arxiv.org/abs/2611.05358 | v1 dated 3 Nov UTC, outside window |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| OpenAI raises $11B at $1.25T, round up to ~$20B (Bloomberg via TechCrunch, 6 Nov) | https://techcrunch.com/2026/11/06/openai-reportedly-raises-an-additional-11-billion-at-a-1-25-trillion-valuation/ | Secondary only; no Form D found |
| Australia: mandatory frontier-AI safeguards and regulator (10 Nov) | https://www.sbs.com.au/news/article/ai-safeguards-open-ai-medicare-breach-albanese/2pbsdc5nr | SBS only; minister.industry.gov.au timed out |
| Anthropic $3.4B of gas turbines (FT via TechCrunch, 9 Nov) | https://techcrunch.com/2026/11/09/anthropic-joins-ais-natural-gas-frenzy-buys-3-4b-worth-of-turbines/ | Secondary only; not in S-1/A No. 2 |
| Google buys Crusoe's Wyoming project (6 Nov) | https://techcrunch.com/2026/11/06/crusoe-sells-troubled-wyoming-data-center-project-to-google/ | Crusoe newsroom not reached; price undisclosed |
| Data-centre ballot measures, US midterms (CNBC, 4 Nov) | https://www.cnbc.com/2026/11/04/data-center-ballot-measures-2026-midterm.html | CNBC 403; Ballotpedia empty |
| Microsoft enables Claude by default for UK Copilot tenants from 9 Dec (The Register, 10 Nov) | https://www.theregister.com/ai-and-ml/2026/11/10/microsoft-is-giving-claude-the-keys-to-uk-copilot-tenants-by-default/5308693 | Contradicted by Microsoft Learn page ("disabled by default") |
| Meta–Conductor; Palo Alto–Clutch ("in talks") | — (exact URL not recorded by the harvest) | Secondary only / unconfirmed |
| EU AI Act Art. 75c/75d (consultation closed 9 Nov) | — (exact URL not recorded by the harvest) | Tracker only; no adopted text |
| China CAC unified filing system (9 Nov) | — | Single crypto outlet; no CAC notice found |

---

## 3. Method

- **Window:** the seven days ending 2026-11-10, inclusive (4–10 November).
- **Beats swept:**
  - Releases: Anthropic, Google blog and Gemini changelog, Meta developer blog, Mistral, Tencent, Thinking Machines, DeepSeek docs, the HF API by creation date for ~22 orgs, HF trending, OpenRouter models API, and OpenAI via `news/rss.xml` plus `scripts/fetch_openai.py`.
  - Research: HF daily papers 4–10 Nov, arXiv cs.CL/cs.LG/cs.AI/cs.CV recent listings, and lab research pages. Every cited abs page was re-read with curl at writing time, and the HTML v1 was read for affiliations and the AISI rates.
  - Benchmarks: AA leaderboard (JSON in page), AA methodology and articles, the Vals Index and Terminal-Bench 4.0 pages, the Epoch ECI CSV and publications, METR, ARC Prize, Apollo, UK AISI, CAISI and Scale.
  - Industry/policy: SEC EDGAR (curl with UA), company newsrooms, Federal Register API, justice.gov, gov.uk, Gulf sources, and TechCrunch/The Register for leads.
- **Process:** four research sub-agents ran the harvest in parallel. Every figure, identifier and date in the report was then re-read by the compiler directly from the primary on 2026-11-10. The S-1/A was downloaded and searched for each quoted figure. Vendor numbers are labelled as the vendor's own; AA, Vals and Epoch figures are independent.
- **Left out for lack of verification:** OpenAI round, Australian safeguards, Anthropic turbines, Crusoe/Google, Microsoft UK default (see table above).
- **Known gaps:**
  - Unreachable: arena.ai (403, not retried), humain.com (403), spa.gov.sa (empty), minister.industry.gov.au (timeout), CNBC (403), Bloomberg/FT (paywall), hy.tencent.ai and longcat.ai (JS-only).
  - AA and Epoch both changed method this week (AA v5.0.1 CritPt v2 regrade; Epoch Bayesian ECI), so the issue shows no week-on-week deltas for them.
  - The one Gulf item (HUMAIN–Infra) rests on an SPA wire report carried by Asharq Al-Awsat, not on a HUMAIN or Infra page.
