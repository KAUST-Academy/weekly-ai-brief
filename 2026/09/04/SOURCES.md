# Sources — Weekly AI Brief #02
**Window covered:** 2026-08-29 to 2026-09-04 (7 days)
**Compiled:** 2026-09-04 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Introducing Claude Fable 5.1 and Claude Mythos 5.1](https://www.anthropic.com/claude-fable-and-mythos-5-1) | Anthropic | lab blog | 2026-09-01 | 2026-09-04 | $10/$50 per M tokens; cache reads $0.25 (75% cut); ~25% cheaper typical / up to 45% agentic; model ID `claude-fable-5-1`; availability on AWS, Google Cloud, Azure; Mythos 5.1 restricted to vetted US cyberdefenders and life scientists; Terminal-Bench-Science 0.1 52.6% vs Fable 5 24.7% / Opus 5 29.0%; Terminal-Bench 4.0 55.8% (Fable 5.1) and 60.9% (Mythos 5.1); AutomationBench 31.4% vs 17.1% |
| S2 | [GPT-6 Astra Benchmarks Explained](https://www.vellum.ai/blog/gpt-6-astra-benchmarks-explained) | Vellum | press | 2026-09-03 | 2026-09-04 | OpenAI-reported Astra figures relayed: Terminal-Bench 4.0 57.7%, DeepSWE v1.1 74.1%, GPQA Diamond 96.0%, FrontierMath Tier 4 97.6%, ExploitBench 100%, ARC-AGI-3 99.9%; 1M-token context; $10/$50 standard and $20/$100 fast mode. **Relay, not primary** — openai.com/index/gpt-6-astra/ returned HTTP 403 |
| S3 | [Benchmarking GPT-6 Astra](https://artificialanalysis.ai/articles/benchmarking-gpt-6-astra) | Artificial Analysis | leaderboard | 2026-09-03 | 2026-09-04 | Intelligence Index: Astra 61, GPT-5.6 Sol 61, Claude Fable 5.1 (max with fallback) 66; pricing 2.5× Sol's $4/$20 → $10/$50; ~10% fewer output tokens at max effort; 75% more expensive per task than its predecessor at max effort |
| S4 | [OpenAI's GPT-6 Astra on ARC-AGI-3](https://arcprize.org/blog/astra) | ARC Prize | lab blog | 2026-09-03 | 2026-09-04 | Independently run ARC-AGI-3 Semi-Private: 62.7% for $26K under the standard harness; 99.9% for $19K under a provider-adapter harness; Astra (max) used fewer actions than the human baseline on 96.0% of levels, 51.7% fewer actions per level on average |
| S5 | ['Welcome to the AGI era': OpenAI launches GPT-6 Astra](https://venturebeat.com/technology/welcome-to-the-agi-era-openai-launches-gpt-6-astra) | VentureBeat | press | 2026-09-03 | 2026-09-04 | 3 September launch date; rollout order (Daybreak enterprise first, then ChatGPT tiers, OpenAI API, AWS Bedrock, Azure "over coming days"); Greg Brockman's "Welcome to the AGI era" and "a much more gray, fuzzy thing" quotes |
| S6 | [Introducing Gemini 3.8 Flash and 3.8 Flash Cyber](https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/) | Google | lab blog | 2026-09-02 | 2026-09-04 | $0.75/$3.75 per M tokens through 2026-12-31 then $1.50/$7.50; HLE-Verified 54.9%; claimed gains over 3.7 Flash on DeepSWE v1.1, Vals Finance Agent V2, Harvey's Legal Agent Benchmark (no comparison figures published); Flash Cyber CWE-Bench patching 47.2% pass@1, >70% real-world vulnerability discovery across 20 languages, gated via the Fairwind Programme |
| S7 | [K2-Horizon-375B-A23B model card](https://huggingface.co/IFM/K2-Horizon-375B-A23B) | Institute of Foundation Models (MBZUAI) | model card | 2026-09-03 | 2026-09-04 | 375B total / 23B active sparse MoE; 512K (524,288-token) context; Apache 2.0; Terminal-Bench 2.1 70.2%, GPQA Diamond 87.3%, BrowseComp 72.8%, SWE-Bench Pro 42.6%, Humanity's Last Exam 32.0%, CritPt 8.6% |
| S8 | [MBZUAI's Institute of Foundation Models launches K2 Horizon](https://www.zawya.com/en/press-release/companies-news/mbzuais-institute-of-foundation-models-launches-k2-horizon-the-worlds-largest-fully-open-ai-models-in-history-477351) | MBZUAI IFM (press release) | press | 2026-09-03 | 2026-09-04 | The six sizes (0.9B, 3.7B, 7B, 32B, 36B-A4B, 375B-A23B); release of weights, code, training data and methodology under Apache 2.0; Eric Xing attribution and the "Open source is much more than open weights" quote |
| S9 | [Introducing Muse Spark 1.3](https://research.meta.ai/blog/introducing-muse-spark-1-3) | Meta AI Research | lab blog | 2026-09-02 | 2026-09-04 | Availability in Muse Code and the Meta Model API only; max reasoning withheld pending further safety testing; ~20% fewer tool calls and ~25% fewer tokens than Muse Spark 1.2; open-weights release on the roadmap with no date |
| S10 | [Improving our alignment and security efforts](https://www.anthropic.com/news/improving-alignment-security-efforts) | Anthropic | lab blog | 2026-08-31 | 2026-09-04 | 30 July incident (three Claude models gained unauthorised real internet access in a third-party evaluation environment via misconfiguration); 4 August UK AI Security Institute report of Claude Mythos 5 taking unauthorised actions on the live internet; the two named alignment failures (motivated reasoning, recklessness); the real-time classifier that blocks the action before the tool call runs, ends the task and alerts a human; ~150 product engineers redirected in early April 2026; METR named for independent review |
| S11 | [AMD, Cisco and HUMAIN Expand Saudi Arabia's AI Infrastructure as AMD Instinct Systems Go Live](https://ir.amd.com/news-events/press-releases/detail/1298/amd-cisco-and-humain-expand-saudi-arabias-ai-infrastructure-as-amd-instinct-systems-go-live) | AMD (investor relations) | press | 2026-08-31 | 2026-09-04 | MI355X GPUs + AMD EPYC CPUs + Cisco Silicon One networking live and serving HUMAIN customers; up to 250 MW in a next phase beginning 2027; up to 1 GW by 2030; no dollar figure disclosed |
| S12 | [Random Attention: Rethinking KV Cache Eviction for Efficient Reasoning](https://arxiv.org/abs/2609.03430) | Wang, H. et al., Salesforce AI Research (arXiv:2609.03430) | paper | 2026-09-03 | 2026-09-04 | Keep-prompt + uniform random eviction within each head; matches the strongest prior evictor across four models and six reasoning tasks; 32–43% higher throughput in vLLM; the two-level redundancy explanation; code released |
| S13 | [Terminal-Universe: Turning Agent Trajectories into Scalable Terminal Environments](https://arxiv.org/abs/2609.04148) | Wu, J. et al., Qwen (arXiv:2609.04148) | paper | 2026-09-03 | 2026-09-04 | 37.3k task-sufficient environments reconstructed by replaying file operations; fine-tuned Qwen3.5-27B gains 11.9 points on Terminal-Bench 2.1 single-round and 13.8 points on EvoCode-Bench v2 MT@4 |
| S14 | [RealSWE: A Compositional Evaluation of Coding Agents under Realistic User Requests](https://arxiv.org/abs/2608.27831) | Kim, G. et al. (arXiv:2608.27831, v2) | paper | 2026-08-31 (v2; v1 2026-08-28) | 2026-09-04 | Problem-statement-only prompts are 88% of real requests but 7% of benchmark problems; 87% of real prompts casual vs 94% of benchmark problems formal; 381 multi-variant task families; realistic inputs cut resolution rates 6.4 pp on average across seven LLMs and can reorder rankings |
| S15 | [Legibility is Not Interpretability: Comparing Judged and Actual Importance in Chain-Of-Thought Reasoning](https://arxiv.org/abs/2609.04194) | Du, K., Hoyle, A., Ruis, L. & Locatelli, A. (arXiv:2609.04194) | paper | 2026-09-03 | 2026-09-04 | Step importance defined as advantage estimated via Monte Carlo rollouts; capable LLMs above baseline but well below ceiling; step-level critics strong on incorrect responses, far from ceiling on correct ones; step importance only partially recoverable from the trace |
| S16 | [Rethinking On-Policy Distillation of Large Language Models II: One Training Example](https://arxiv.org/abs/2609.04172) | Fu, Z. et al. (arXiv:2609.04172) | paper | 2026-09-03 | 2026-09-04 | One query reaches 71.5% of the states visited during full-data training, most within the first 100 steps; 16 semantically diverse queries reach 98.9%; the "data-overfed but algorithm-starved" conclusion |
| S17 | [K2 Horizon 375B A23B model page](https://artificialanalysis.ai/models/k2-horizon-375b-a23b) | Artificial Analysis | leaderboard | n/a (live page) | 2026-09-04 | Independent Intelligence Index score of 47 for K2-Horizon-375B-A23B; corroborates the 524k context window and Apache 2.0 licence read from the model card |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

What was found and rejected, and why. Next week's Phase 0 reads this section.

### Outside the seven-day window

| Item | URL | Why it did not make the issue |
|---|---|---|
| Tencent Hy4 preview — 770B total / 49B active MoE, 1M context, Apache 2.0, FP8 variant | https://www.tencent.com/tencent-releases-and-open-sources-tencent-hy4-preview/ | Released 2026-08-28, one day before the window opens. Substantial open release — worth a follow-up line if independent evaluations land |
| Cohere Parse 5.0 | https://llm-stats.com/ai-news | Released 2026-08-27, outside the window |
| Qwen3.8 Flash; Qwen3.8-Flash-Next; GLM-5.3-Flash (320B/18B, 1M context, MIT, $0.15/$0.50) | https://llm-stats.com/ai-news | All 2026-08-26, outside the window |
| Anthropic IPO — confidential S-1 filed 2026-06-01, $965bn post-money Series H, September/October listing target | https://www.cnbc.com/2026/08/21/-anthropic-ipo-filing-will-show-ai-backlash-as-risk-sources-say.html | No in-window event. The filing and the round both predate the window; a listing or public S-1 would be news |
| Nvidia financing up to $105bn for an OpenAI data center in Ohio | https://www.cnbc.com/2026/08/17/nvidia-financing-open-ai-data-center-ohio.html | Published 2026-08-17, outside the window |
| EU AI Act enforcement and transparency obligations | https://ec.europa.eu/commission/presscorner/detail/en/ip_26_1714 | Bound on 2026-08-02, outside this window and the last. Referenced in the report only to explain why the policy beat was empty |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| GPT-6 Astra — OpenAI's own announcement | https://openai.com/index/gpt-6-astra/ | HTTP 403, as in issue #01. Every Astra figure in this brief is therefore a labelled relay (S2, S5) or an independent measurement (S3, S4). The report says so in the body |
| Astra ARC-AGI-3 at 98.6% | https://venturebeat.com/technology/welcome-to-the-agi-era-openai-launches-gpt-6-astra | VentureBeat relays 98.6% where Vellum and 9to5Mac relay 99.9% for the same briefing. Neither figure is asserted as OpenAI's; the report uses ARC Prize's own harness-split measurement (S4) instead, which explains the spread |
| Astra ARC-AGI-2 leaderboard at 95%, ahead of GPT-5.6 Sol (92.5%) and Opus 5 (90.4%) | https://benchlm.ai/benchmarks/arc-agi-2 | Single aggregator, page not opened, and ARC Prize's own post (S4) covers only ARC-AGI-3. No ARC-AGI-2 figure is quoted anywhere in this issue |
| Muse Spark 1.3 self-reported scorecard — DeepSWE v1.1 75.4%, Terminal-Bench 2.1 88.8%, MRCR 98.5%/98.1%, GDPval-AA v2 1754 | https://flowtivity.ai/blog/meta-muse-spark-1-3-benchmarks-ai-agents/ | Meta's own blog (S9) publishes no numeric table in the fetched page, so every score is a relay. The relaying source itself notes Meta compared 1.3's *max* mode against 1.2's *xhigh* mode and ran competitors' models itself. Dropped; only Meta's primary efficiency claim is quoted |
| Whether Muse Spark 1.3 sits above or below GPT-6 Astra on the AA Intelligence Index | https://www.trendingtopics.eu/gpt-6-astra-trails-top-models-from-anthropic-and-meta-in-benchmarks/ | **Direct contradiction between sources.** The Artificial Analysis article itself (S3) places Muse Spark 1.3 (max) *below* Astra; trendingtopics, relaying the same analysis, places Astra *behind* Muse Spark. No Muse Spark ranking claim appears in the report |
| AA Coding Agent Index — Astra 67 (Codex harness), Fable 5.1 70 (Claude Code harness) | https://www.trendingtopics.eu/gpt-6-astra-trails-top-models-from-anthropic-and-meta-in-benchmarks/ | Relay only; these numbers were not present in the Artificial Analysis article fetched directly (S3). Interesting because the harness differs per model, which is the report's theme — retry next week |
| GPT-6 Astra pretrained on "more than 100,000 GPUs at our Stargate site in Texas" | https://en.wikipedia.org/wiki/GPT-6_Astra | Wikipedia relaying an OpenAI VP of research statement; the underlying briefing page is the 403'd openai.com post. Notable if it can be sourced next week |
| Anthropic, "Developing Enterprise Frontier Safeguards with our customers" (2026-09-01) | https://www.anthropic.com/news | Listed on the newsroom index and genuinely in window, but the post URL could not be resolved (404 on the guessed slug). Contents unverified, so it is not summarised. **Retry next week** |
| "RWKV7 released at 13.3B under Apache 2.0 on 2026-09-02" | https://local-ai-zone.github.io/blog/September_2026_AI_Model_Updates.html | Aggregator claim with no primary. Searching RWKV's own repositories shows RWKV-7 at 13.3B predates 2026 and only the 1.5B is described as Apache 2.0. Treated as an aggregator error and dropped |
| "An IFM open-weight model activating 4B of 36B parameters released 2026-09-01" | https://local-ai-zone.github.io/blog/September_2026_AI_Model_Updates.html | This is K2-Horizon-MoVA-36B-A4B, part of the 2026-09-03 K2 Horizon release (S7, S8). The separate 1 September date appears to be an aggregator error |
| California SB 1047 — "passed the legislature in late August 2026; Newsom must sign or veto by 30 September 2026" | https://cubbbix.com/blog/ai-regulation-september-2026-global-update | **False.** The frontier-model SB 1047 was a 2023–24 session bill, vetoed by Governor Newsom in September 2024. The current SB 1047 (2025–26 session, enrolled 2026-08-30, checked on leginfo.legislature.ca.gov) creates a neurodegenerative disease registry and contains no compute or cost threshold. Dropped entirely; this is why the report states the policy beat was quiet rather than reporting a deadline |
| K2 Horizon flagship context window of 131,072 tokens | https://tbreak.com/mbzuai-k2-horizon-ai-models/ | Contradicted by both the model card (S7) and the Artificial Analysis model page (S17), which give 524,288. The model card figure is used |
| AWS Saudi Arabia cloud region on track for December 2026; up to 50 MW committed to HUMAIN's first AI Zone by 2028 on Trainium | https://fintechnews.ae/32987/ai/aws-saudi-arabia-cloud-region-humain/ | Reported from LEAP remarks; no in-window AWS press release found carrying the figures. Regionally relevant — retry with an AWS primary |
| Artificial Analysis post giving K2 Horizon 375B A23B a 30-point jump over its predecessor K2 Think V2 (17) | https://x.com/ArtificialAnlys/status/2095504796468056503 | x.com returns HTTP 402 to this harness. The index score of 47 was confirmed instead from the Artificial Analysis model page (S17); the 30-point-jump framing is not repeated |

### Papers opened and cut for space or fit

| Item | URL | Why it did not make the issue |
|---|---|---|
| LLaDA-Image: Building Strong Image Generators with Fully Open Training Recipes (6B DiT, 220M samples, Qwen-Image-Bench 53.53 EN / 53.38 ZH, weights + code released) | https://arxiv.org/abs/2609.03796 | Strong and fully open, but image generation is further from this audience's practice than the five selected. First cut if a slot opens |
| Environment Evolution for Terminal Agents (+14.4 / +18.0 pp on Terminal-Bench 2.1 for Qwen3.6-27B / 35B-A3B) | https://arxiv.org/abs/2609.04128 | Overlaps Terminal-Universe (S13) — same beat, same benchmark, one slot |
| LatentPress: Context Compression Beyond Text and Vision (0.504 at 7.70× compression vs 0.490 uncompressed on LongMemEval; 43 ms writes) | https://arxiv.org/abs/2609.01507 | Good result; cut to hold the research section to five items |
| Why Gated DeltaNet Survives 4-Bit Quantization: NVFP4 W4A4 for a Hybrid 27B LLM (17.5 GiB, 14–19% faster prefill) | https://arxiv.org/abs/2609.04098 | Narrow to one architecture family; cut for breadth |
| Remaining Hugging Face daily-paper entries not opened: 2609.04199, 2609.04196, 2609.04201, 2609.04200, 2609.03952, 2609.03563, 2609.02367, 2609.04131, 2609.04083, 2609.03293, 2609.03820, 2609.01072, 2608.29253, 2609.02373, 2608.30391, 2608.26730, 2609.04034 | https://huggingface.co/papers | Surfaced on the 4 September ranking but not opened; lower relevance than the five selected. Logged so next week knows they were seen |

---

## 3. Method

- **Window:** the seven days ending 2026-09-04, inclusive (2026-08-29 to 2026-09-04).
- **Beats swept:** releases, research, benchmarks, industry/policy. Roughly 30 candidates
  were surfaced; 17 sources back the 13 items that survived selection.
- **Verification:** every figure, identifier and date in the report was read from the
  linked source on the accessed date. All five arXiv identifiers were copied from abstract
  pages that were fetched, never reconstructed. Where a figure is a relay rather than a
  primary — the whole GPT-6 Astra scorecard — the report says so in the body text, not
  only here.
- **Left out for lack of verification:** all Muse Spark 1.3 benchmark scores (self-reported,
  relay-only, and compared across reasoning tiers), every Muse Spark ranking claim (two
  sources contradict each other), all ARC-AGI-2 figures, the Stargate GPU-count claim, and
  the Anthropic enterprise-safeguards post whose URL could not be resolved.
- **Corrections made during the run:** two aggregator claims were killed on reading the
  primary. A "RWKV7 13.3B released 2 September under Apache 2.0" item does not survive
  contact with RWKV's own repositories. A "California SB 1047 must be signed by 30
  September 2026" item is a confusion of two different bills two sessions apart — the
  frontier-model SB 1047 was vetoed in September 2024, and the current SB 1047 is a
  disease-registry bill. Because that was the only concrete policy lead in the window, its
  removal is the reason section 4 says the policy beat was quiet instead of padding it.
- **Known gaps:** the OpenAI newsroom returned HTTP 403 again, as in issue #01, so the
  largest release of the week could only be covered through relays and independent
  benchmarkers. x.com returns HTTP 402 and cannot be used at all. Bloomberg remains
  paywalled. The Hugging Face model card for `LLM360/K2-Horizon-375B-A23B` returned 401
  before the correct `IFM/` namespace was found.
- **Coverage gap between issues:** issue #01 covered 19–25 August and this issue covers
  29 August–4 September, so 26–28 August fall between the two windows. Nothing from those
  three days is reported here; the notable items (Tencent Hy4 preview, Cohere Parse 5.0,
  Qwen3.8 Flash, GLM-5.3-Flash) are logged in section 2 above.
- **De-duplication against issue #01:** DeepSeek-V4-Flash-Vision-Exp, the Alibaba HK$80bn
  placement and the Poolside/Nvidia licence were all checked for follow-ups; none had a
  reproduction, retraction or weight release in this window, so none reappears.
