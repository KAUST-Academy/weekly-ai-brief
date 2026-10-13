# Sources — Weekly AI Brief #08
**Window covered:** 2026-10-07 to 2026-10-13 (7 days)
**Compiled:** 2026-10-13 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Claude Haiku 5.5](https://www.anthropic.com/claude-haiku-5-5) | Anthropic | lab blog | 2026-10-07 | 2026-10-13 | `claude-haiku-5-5`; $0.10/$0.50 (≤100k), $0.50/$2.50 (>100k) vs Haiku 4.5 $1/$5; cache reads $0.01/$0.05; "around 75% less" (90% ≤100k, 50% >100k); Sonnet 5.5 cache reads $0.20→$0.10, ~20% cheaper on most agentic tasks; self-reported OSWorld 2.1 offline 72.4/15.7/48.9/83.9 and Terminal-Bench 4.0 39.2/0.0/16.4/70.6 (Haiku 5.5 / Haiku 4.5 / GPT-6 Luna / Sonnet 5.5) |
| S2 | [Claude Haiku 5.5](https://artificialanalysis.ai/articles/claude-haiku-5-5) | Artificial Analysis | leaderboard | 2026-10-07 | 2026-10-13 | Intelligence Index 43 (max), 38 (high); +26 over previous Haiku |
| S3 | [Introducing Muse Wonder models](https://about.fb.com/news/2026/10/introducing-muse-wonder-models/) | Meta | lab blog | 2026-10-12 | 2026-10-13 | Release date; Wonder on Meta Model API (preview) and Muse Code; Wonder Full in Muse Code only |
| S4 | [Muse Wonder model card](https://research.meta.ai/static/muse-wonder-model-card) | Meta | model card | 2026-10-12 | 2026-10-13 | 1M-token context at inference; Wonder Full CyberGym 88.4%, ExploitBench 58.9%; without mitigations Meta does not rule out "high" chem/bio threshold; capability tables are images (not quoted) |
| S5 | [Muse Wonder](https://artificialanalysis.ai/articles/muse-wonder) | Artificial Analysis | leaderboard | 2026-10-12 | 2026-10-13 | Index v4.3: Wonder Full 56, Wonder 52, Muse Spark 1.3 48; CritPt and GDP.pdf #1 at 33%; GDPval-AA v2.1 1857 vs Opus 5.5 1866 / Sonnet 5.5 1838 within CI; Wonder $4/$0.20/$20; Wonder Full Muse Code only, not priced per token |
| S6 | [Voxtral-Mini-4B-Realtime-Arabic](https://huggingface.co/mistralai/Voxtral-Mini-4B-Realtime-Arabic) | Mistral AI | model card | 2026-10-08 (HF API `createdAt`) | 2026-10-13 | Apache 2.0; ~4.4B params; fine-tuned from Voxtral-Mini-4B-Realtime-2602; MSA + dialects, code-switching; avg CER 8.82% over 7 Arabic benchmarks at 480 ms vs Voxtral Transcribe Arabic 7.91%; co-developed with Morocco's MTNRA |
| S7 | [Falcon-ASR](https://huggingface.co/blog/tiiuae/falcon-asr) | TII | lab blog | 2026-10-07 | 2026-10-13 | 1.6B; Arabic + Emirati focus; avg WER 20.92% on 6 Arabic sets vs best 23.17% in 30 Sep leaderboard snapshot; demo Space only, API "planned" |
| S8 | [When Do We Need On-Policy Distillation?](https://arxiv.org/abs/2610.11291) | Zhao, Fu, … Grover, Molchanov (arXiv:2610.11291) | paper | 2026-10-08 | 2026-10-13 | 17 pairs 1.5B–235B; Semi-OPD beats OPD in 14; up to +13.6% accuracy, 11.4× speedup; OPD helps when token-overlap ratio high. No code linked |
| S9 | [On-Policy Distillation Teaches New Skills but Not New Knowledge](https://arxiv.org/abs/2610.09639) | Tang, Yang (arXiv:2610.09639) | paper | 2026-10-07 | 2026-10-13 | 4 models / 3 families; reverse-KL OPD transfers skill, "minimal factual knowledge"; forward KL restores it. No code |
| S10 | [Thinking Inertia: LLMs Keep Thinking When Told Not To](https://arxiv.org/abs/2610.11765) | Lei, Lin, Lu, Torr, Zou (arXiv:2610.11765) | paper | 2026-10-08 | 2026-10-13 | 6 interventions × 6 LLMs; no-think controls "cannot reliably eliminate visible inference"; effect grows with answer space; NeurIPS 2026; code at github.com/thinking-inertia/code |
| S11 | [Agreement Without Alignment](https://arxiv.org/abs/2610.13303) | Han, Kim (arXiv:2610.13303) | paper | 2026-10-09 | 2026-10-13 | Preregistered; 129,770 judge requests; SummEval α +0.069 (CI 0.046–0.092); Kendall τ diff −0.007 (CI −0.037 to 0.021); code promised |
| S12 | [DiffusionART](https://arxiv.org/abs/2610.12572) | Wan, … Gai, You (arXiv:2610.12572) | paper | 2026-10-08 | 2026-10-13 | HunyuanVideo-13B; 12.02× / 11.72× fewer GPU hours vs DiffusionNFT / Flow-GRPO-Fast; 28.8% / 53.0% higher mean training reward; code github.com/vanzll/DiffusionART |
| S13 | [Models leaderboard](https://artificialanalysis.ai/leaderboards/models) | Artificial Analysis | leaderboard | n/a (live page) | 2026-10-13 | Index scores: Opus 5.5 max 58, Sonnet 5.5 max 56, Muse Wonder Full max 56, Fable 5.1 max 53, GPT-6 Astra max 53, Gemini 4 Argon high 53, Muse Wonder max 52, GPT-6.1 Sol max 52, Haiku 5.5 max 43. Model pages show v4.3.2 and rank denominators 216 vs 689 (Muse Wonder Full) |
| S14 | [Vals Index](https://www.vals.ai/benchmarks/vals_index) | Vals AI | leaderboard | updated 2026-10-12 | 2026-10-13 | v2.1: Argon 68.90%, Sonnet 5.5 67.04%, Opus 5.5 66.97%, Fable 5.1 65.83%, Wonder Full 64.57%, Astra 63.13%, GPT-6.1 Sol 61.15%, Wonder 61.06%; Anthropic scores include fallback answers |
| S15 | [ECI scores (CSV)](https://epoch.ai/data/eci_scores.csv) | Epoch AI | leaderboard | 2026-10-13 | 2026-10-13 | Opus 5.5 167.33 (CI 164.06–171.68), Astra 166.45, GPT-6.1 Sol 166.09, Sonnet 5.5 165.03, Fable 5.1 164.70; Argon, Muse Wonder, Haiku 5.5 not listed |
| S16 | [FrontierCode](https://artificialanalysis.ai/articles/frontiercode) | Artificial Analysis | leaderboard | 2026-10-12 | 2026-10-13 | 100 tasks, maintainers of 36 repos; Opus 5.5 52%, GPT-6.1 Sol 49% (~$0.81/task vs ~$10.15 Opus), Fable 5.1 49% |
| S17 | [Harvey LAB-AA v1.1](https://artificialanalysis.ai/articles/harvey-lab-aa-v1-1) | Artificial Analysis | leaderboard | 2026-10-08 | 2026-10-13 | Material hallucination fails a task; top Grok 4.7 (xhigh) 9.4%; >60% of otherwise-passing results had a material hallucination |
| S18 | [Investigating unintended model actions](https://www.anthropic.com/research/investigating-unintended-model-actions) | Anthropic | lab blog | 2026-10-09 (correction 2026-10-12) | 2026-10-13 | Four behaviour categories; Haiku 4.5 police tip form, flagged as spam, never forwarded; Philadelphia PD self-disclosed; Anthropic shared findings 8 Oct; live internet off for internal evals; web-fetch restricted |
| S19 | [Disrupting AI-enabled false-front operations](https://openai.com/index/disrupting-ai-enabled-false-front-operations/) | OpenAI | lab blog | 2026-10-08 | 2026-10-13 | "Dark Clark" (Russia) Category 5, first disrupted; "Bogus Bylines" (Iran) Category 4, seven fake journalist personas; 30 IOs exposed since early 2024. Read via `scripts/fetch_openai.py` |
| S20 | [Microsoft to expand Azure Maia system to multi-gigawatt deployments](https://blogs.microsoft.com/blog/2026/10/12/microsoft-to-expand-azure-maia-system-to-multi-gigawatt-deployments/) | Microsoft (Scott Guthrie) | press | 2026-10-12 | 2026-10-13 | Maia 300 production from 2027; primary inference system; +40% tokens/MW vs leading GPU systems; up to 7× Maia 200 rack throughput; 8 HBM4 stacks at 18.0 TB/s; no gigawatt figure |
| S21 | [Britain steps up national defences against growing AI risks](https://www.gov.uk/government/news/britain-steps-up-national-defences-against-growing-ai-risks) | UK Government (Cabinet Office, AISI, NCSC, DCMS) | press | 2026-10-12 | 2026-10-13 | Pilots extended, >1,000 potential vulnerabilities; Cyber Security and Resilience Bill "AI loss of control risk"; near-miss reporting for autonomous-agent incidents; no funding figure |
| S22 | [Series B](https://arena.ai/blog/series-b) | Arena | press | 2026-10-08 | 2026-10-13 | $200M at $3.1B; Lightspeed and Khosla co-led; >$100M annualized revenue; Alignment Index preview (unauthorized action, false attribution, deceptive completion) |
| S23 | [European AI Innovation Month: save the date](https://digital-strategy.ec.europa.eu/en/news/european-ai-innovation-month-save-date) | European Commission | regulation | updated 2026-10-13 | 2026-10-13 | 14 Oct – 17 Nov; opens in Ireland; closes with Apply AI Summit, Brussels |
| S24 | [NIST SP 1353 (initial public draft)](https://csrc.nist.gov/pubs/sp/1353/ipd) | NIST | regulation | 2026-08-19 | 2026-10-13 | Comments close 15 Oct 2026 (forward-looking item; draft predates window) |
| S25 | [Executive Order 14434](https://www.federalregister.gov/documents/full_text/text/2026/10/02/2026-20321.txt) | Federal Register | regulation | 2026-10-02 | 2026-10-13 | Signed 29 Sep; Sec. 3(b) proposed legislative language within 60 days (≈28 Nov) (forward-looking item) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

### Opened, but outside the window or already covered

| Item | URL | Why it did not make the issue |
|---|---|---|
| Mistral Large 4 | https://mistral.ai/news/mistral-large-4/ | Dated **6 Oct**, one day before window; issue #07 missed it. Not carried as a late item; consider a follow-up if independent scores appear |
| EmbeddingGemma 2 | https://blog.google/innovation-and-ai/technology/developers-tools/embeddinggemma-2/ | 6 Oct, outside |
| Gemini Nano Banana 2.1 GA | https://ai.google.dev/gemini-api/docs/changelog | 6 Oct, outside; 8 Oct changelog entry is deprecations only |
| Cohere North 2 | https://cohere.com/blog/introducing-north-2 | 5 Oct, outside |
| GPT-Live-1 in the API | https://openai.com/index/introducing-gpt-live-1-in-the-api/ | Dated 10 Sep; sitemap re-render |
| Other OpenAI sitemap slugs (previewing-gpt-5-6-sol, codex-flexible-pricing-for-teams, a-scorecard-for-the-ai-age, etc.) | https://openai.com/sitemap.xml | On-page dates 2025 – Sep 2026; re-renders |
| Cross-Tokenizer OPD (2610.08448), TRACE (2610.07767), Recurrent Looped Transformer (2610.07591), KLPO (2610.08963), HuatuoGPT-3 (2610.05966) | https://arxiv.org/abs/2610.08448 | v1 dates 5–6 Oct, outside |
| ALoDLM (2610.04198) | https://arxiv.org/abs/2610.04198 | Rechecked: still no code linked |
| Gemini 4 Argon paid API / GPT-6.1 Sol Ultrafast / Decisions API broad release | https://ai.google.dev/gemini-api/docs/changelog | Watch items from #07: no in-window primary showing either shipped |
| Liquid AI open d1 decision models | https://huggingface.co/blog/LiquidAI/open-d1 | Blog in window but repos created 5 Oct; similar to Clef (covered #07) |

### Opened, in window, but weaker than the selection

| Item | URL | Why it did not make the issue |
|---|---|---|
| GPT-6 with Intelligent UI rolls out in ChatGPT (7 Oct) | https://openai.com/index/gpt-6-for-everyone/ | Consumer rollout of models covered in #06; only internal-eval claims |
| Microsoft-Decision-1 (9 Oct) | https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-microsoft-decision-1-in-microsoft-foundry-for-decision-and-classific/4562742 | Two Microsoft pages give contradictory Xbox comparison claims (GPT-5 80–100× vs GPT-6 Sol 14×) |
| MiniCPM-V 4.7 35B-A3B (7 Oct) | https://huggingface.co/openbmb/MiniCPM-V-4.7-35B-A3B | Apache 2.0, but benchmark numbers only in images |
| Qwen-Image-2.1-Turbo (9 Oct) | https://huggingface.co/Qwen/Qwen-Image-2.1-Turbo | Research licence; distilled checkpoint of existing model |
| LIDstral-Arabic (8 Oct) | https://huggingface.co/mistralai/LIDstral-Arabic | Companion to Voxtral Arabic; space |
| Google Cloud Gemini agent (8 Oct); SynthID Detector global (7 Oct); NVIDIA RTX Spark preorders (7 Oct) | https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/gemini-at-work/ | Product news without model IDs, prices or measurable claims builders can act on |
| ELR / Koi-4B (2610.12582) | https://arxiv.org/abs/2610.12582 | Strong result but no checkpoint or code linked |
| MSAR (2610.13630) | https://arxiv.org/abs/2610.13630 | Repo appears to be report only |
| Clinician use of LMs (2610.11069) | https://arxiv.org/abs/2610.11069 | Good data; cut for space |
| Oído (2610.13447) | https://arxiv.org/abs/2610.13447 | Code released; cut for space (not real time: 1.97× audio duration) |
| TokenRouter (2610.12242) | https://arxiv.org/abs/2610.12242 | Serving systems niche; cut for space |
| Subliminal learning defence (2610.13536); critique-conditioned OPD (2610.13744); REMORY (2610.11287); MiMo-V2.6 (2610.11959); Long-WAM (2610.10528); SparseDecoding (2610.12327) | https://arxiv.org/abs/2610.13536 | Weaker or no headline numbers |
| Anthropic, self-replicating AI (12 Oct) | https://www.anthropic.com/research/self-replicating-ai | Simplified-environment evaluation; space went to the incident report |
| Anthropic, distillation defenses (12 Oct) | https://www.anthropic.com/research/distillation-defenses | Not read beyond title |
| Nvidia $1B US science commitment (8 Oct) | https://nvidianews.nvidia.com/news/nvidia-commits-1-billion-to-advance-us-science-over-the-next-five-years | Lower relevance to builders; cut for space |
| AA-3D benchmark (12 Oct); AA Cyber Index trusted-access entry (8 Oct) | https://artificialanalysis.ai/articles/aa-3d | AA-3D a statistical tie; Cyber Index score only in a chart image |
| Nemotron IOI/IMO 2026 results (7 Oct) | https://huggingface.co/blog/nvidia/nemotron-ioi-and-imo-2026 | Self-reported competition results; cut for space |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| Manus (Butterfly Effect) raises >$500M | https://techcrunch.com/2026/10/08/chinas-manus-raises-over-500m-in-first-funding-round-since-split-with-meta/ | TechCrunch only (WeChat post not opened) |
| Automation Anywhere to acquire Boost.ai | https://www.automationanywhere.com/company/press-room/conversational-ai-finally-connected-work-automation-anywhere-acquire-boostai | Press release not fetched |
| SoftBank seeking up to $100B from Gulf investors | https://www.thestar.com.my/tech/tech-news/2026/10/09/softbank-seeks-up-to-100-billion-from-gulf-investors-for-ai-push-ft-reports | FT report only; unconfirmed |
| OpenAI ~$30B round with UAE funds / BlackRock | https://news.crunchbase.com/venture/biggest-funding-rounds-ai-space-fintech-temporal/ | Still secondary only; OpenAI declined comment |
| Anthropic pre-IPO investor day, reportedly 14 Oct | https://www.bloomberg.com/news/articles/2026-10-01/anthropic-is-said-to-plan-pre-ipo-investor-day-as-listing-nears | Single-source "is said to"; Anthropic declined comment |
| OpenAI fires three safety researchers | https://abcnews.com/Technology/wireStory/openai-fires-3-safety-researchers-dispute-ai-risks-137123277 | AP only; primary not fetched |
| China new-quality-productive-forces guidelines (9 Oct) | https://www.thestar.com.my/news/world/2026/10/10/1st-ld-writethru-china-focus-china-issues-guidelines-on-developing-new-quality-productive-forces | Xinhua reprint only; no gov.cn text |
| Grok Imagine Video 1.5 Lite | https://docs.x.ai/docs/guides/video-generation | Release date unverified (x.ai/news 403) |
| Firmus scraps ASX IPO; Amazon–Decart talks | https://ia.acs.org.au/article/2026/australian-data-centre-company-firmus-scraps-asx-float.html | No primary; conflicting figures / unconfirmed talks |
| Philadelphia PD criticism of two-month delay (Reuters, 6abc) | https://www.anthropic.com/research/investigating-unintended-model-actions | Police statement not opened directly; report uses only Anthropic's account |

---

## 3. Method

- **Window:** the seven days ending 2026-10-13, inclusive (7–13 October).
- **Beats swept:** releases (OpenAI via `fetch_openai.py` and news RSS, anthropic.com, blog.google, Meta, Mistral, Microsoft, NVIDIA, HF API by org, release trackers as leads); research (HF daily papers 7–10, 12, 13 Oct; arXiv cs.CL and cs.LG new listings; lab research blogs); benchmarks (Artificial Analysis leaderboard and articles, Vals Index, Epoch ECI CSV); industry/policy (company press rooms, gov.uk, EC digital-strategy, NIST CSRC, Federal Register).
- **Verification:** every figure, identifier and date in the report was read from the primary source above on 2026-10-13. Haiku 5.5, Muse Wonder (AA), the AA leaderboard, Semi-OPD, Voxtral Arabic, the Anthropic incident report and the Epoch CSV were re-read a second time when the issue was written. Vendor benchmark numbers are labelled self-reported. AA, Vals and Epoch rows are independent.
- **Known gaps:** LMArena (now arena.ai) leaderboard returned 403; SWE-bench, ARC Prize and Terminal-Bench leaderboards render client-side and returned no rows; cs.AI and cs.CV listings were not swept separately, and HF daily papers for 11 Oct was not fetched; FAIR and MSR blogs were not checked; Meta's capability tables are images and were not quoted; no Gulf policy or compute item was verifiable in window (the Gulf angle is Falcon-ASR and Voxtral Arabic only).
