# Sources — Weekly AI Brief #05
**Window covered:** 2026-09-16 to 2026-09-22 (7 days)
**Compiled:** 2026-09-22 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [Grok 4.7](https://x.ai/news/grok-4-7) | xAI | lab blog | 2026-09-21 | 2026-09-22 | Release date; "most powerful model for coding and knowledge work"; larger base model, longer RL run, training weighted toward tasks taking hours; $2 per 1M input and $6 per 1M output, faster variant at double price for double output speed; availability in Cursor, Grok Build, Grok API, third-party coding harnesses, model routers and cloud platforms; the full seven-row benchmark table in §3 of the report (CursorBench 4.0, DeepSWE v1.1, EEBench, AA Briefcase v1.1, Terminal-Bench 4.0, Harvey Legal Agent, HealthBench Professional) with Grok 4.6, GPT-5.6 Sol and Fable 5.1 columns; DeepSWE figure is the high-effort setting. **The page states no parameter count and no context window** — the report says so explicitly |
| S2 | [Grok 4.7 (xhigh)](https://artificialanalysis.ai/models/grok-4-7) | Artificial Analysis | leaderboard | n/a (live page) | 2026-09-22 | 46 on Artificial Analysis Intelligence Index v4.3.2, #16 of 202; released 2026-09-21; 500K context window; 39.5 output tokens/s (#152 of 202); TTFT 0.85 s; $2.00 / $6.00 per 1M; 75% cache discount; "well above average among comparable models" on intelligence against a 24-point category median. The only independent measurement of Grok 4.7 found this week |
| S3 | [Qwen-Image-2.1](https://github.com/QwenLM/Qwen-Image-2.1) | Alibaba Qwen | documentation | 2026-09-20 | 2026-09-22 | Release date 2026-09-20; Qwen Research License Agreement; 7B parameters in the visual generation component; 32 Single-Stream DiT layers. **Repo carries no benchmark table** — the report asserts no scores for this model |
| S4 | [Qwen-Image-2.1 model card](https://huggingface.co/Qwen/Qwen-Image-2.1) | Alibaba Qwen | model card | n/a (live page) | 2026-09-22 | Qwen Research License Agreement; 7B / 32 Single-Stream DiT layers; native RGBA transparency (generation and editing in one model); up to 10 reference images; local edit specification via annotation methods; mixed-granularity attention and prefix KV cache reuse; improved typography, portrait lighting and fine detail. Card states no benchmark numbers |
| S5 | [LimiX-2 model card](https://huggingface.co/stable-ai/LimiX-2) | Stable AI and Tsinghua | model card | 2026-09-16 | 2026-09-22 | Release date 2026-09-16; 400M parameters; StableAI LimiX Non-Commercial License v1.0; classification, regression and missing-value imputation in one forward pass without task-specific parameter updates; Elo 1935 TabArena ("117.4 points above the runner-up TabFM+"), 1506 TALENT, 1432 BCCO. **Self-reported** — labelled as such in the report |
| S6 | [LimiX-2: A Contextual Mechanism Network Towards General Structured-Data Intelligence](https://arxiv.org/abs/2609.17488) | Zhang, X. et al. (arXiv:2609.17488) | paper | 2026-09-15 | 2026-09-22 | Submission date 2026-09-15; contextual mechanism network; Context-Conditional Masked Modeling (CCMM) pretraining; synthetic data from structural causal models; learns p(x,y \| D_context) rather than the p(y \| x, D_context) objective of conventional tabular prior-fitted networks; evaluated on TabArena, TALENT and BCCO. Paper predates the window by one day; the **weight release (S5) is in-window** and is what the report leads on |
| S7 | [Introducing Gemini 3.8 Live and 3.8 Live Extended Thinking](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-live-gemini-3-8-live-extended-thinking/) | Google DeepMind | lab blog | 2026-09-15 (updated 2026-09-17) | 2026-09-22 | Both model names; 97 supported languages with automatic mid-conversation switching; Extended Thinking reasons and speaks simultaneously with live progress narration; 82.6 on Artificial Analysis Speech to Speech Quality Index (#1), 68.6% τ-Voice, 35.1% Sierra τ-Voice-banking, 97.7% Big Bench Audio, 2nd on Speech Agent Arena; availability across Gemini API, AI Studio, Gemini Enterprise (private preview), Search Live, Workspace and the Gemini app; **no pricing and no context window disclosed**. **Outside the window by one day; the report says so in the body text** |
| S8 | [The Other Half of the Memory Wall: Serving 35B MoEs from SSD with Trained Routing Prediction](https://arxiv.org/abs/2609.18063) | Lin, Y., Wang, Y., Cai, R., Liu, H., Zeng, X. (arXiv:2609.18063) | paper | 2026-09-16 (v1), revised 2026-09-17 (v2) | 2026-09-22 | Edge0; "prerouter" head predicts routing one layer ahead to prefetch experts from SSD; 35B MoE at 20 tokens/s within 3 GB peak active memory on a single 24 GB machine; int4 quantisation plus recovery LoRA adapter; within a few percentage points of the fp16 reference across five public benchmarks; 8B-tier variant on the same framework; framework, checkpoints and adapters open-sourced |
| S9 | [SoL-Pi: Recursively Scaling Auto-Research Loops for Efficient Agent Harness](https://arxiv.org/abs/2609.20519) | Liu, H. et al., NVlabs (arXiv:2609.20519) | paper | 2026-09-17 | 2026-09-22 | Four mechanisms (action execution, context compaction, observation handling, delegated reading); 51-task EdgeBench; token traffic reduced 44.7–49.0%, API cost roughly one third; estimated $8.75–13.50/hour saved vs native and $4.36–5.71 vs the Pi baseline; code at github.com/NVlabs/SoL-Pi; 15 pages |
| S10 | [DeepSeek-V4.1-Flash: Pushing the Limits of KV Cache Compression](https://arxiv.org/abs/2609.19969) | DeepSeek-AI (arXiv:2609.19969) | paper | 2026-09-17 | 2026-09-22 | 552B MoE backbone; 16B active per decode token, 8B during prefill; 1M context; 45T-token multimodal pretraining; cross-layer KV reuse in Compressed Sparse Attention 2 combined with FP4 KV caching; global KV cache 890 bytes/token ≈ 1/4 of DeepSeek-V4-Flash; persistent KV cache ≈ 1/8; "SWA Bounded Replay" for SSD and host memory; checkpoints on Hugging Face. **Follow-up to the 2026-09-10 release covered in issue #04** — carried because it is the architecture report the launch post omitted, and the report says so |
| S11 | [When EOS Tokens Disagree: Understanding Length Inflation in On-Policy Distillation](https://arxiv.org/abs/2609.20511) | Yang, Y. et al. (arXiv:2609.20511) | paper | 2026-09-17 | 2026-09-22 | Termination-token mismatch: base student and post-trained teacher assign stopping probability to different EOS tokens even when declared stopping sets match; Qwen3, Llama and Gemma families; aligning the decoding stopping set alone is insufficient; treating functionally equivalent EOS tokens as one shared semantic stopping action substantially mitigates inflation; stage-wise analysis of K2-Horizon training shows termination preferences shift and **further inflation appears late in training despite the fix**; code at github.com/UNCSciML/opd-eos; 30 pages |
| S12 | [Our framework for reporting model misalignment](https://openai.com/index/model-misalignment-reporting-framework/) | OpenAI | lab blog | 2026-09-16 | 2026-09-22 | Framework plus six reports on behaviour observed in the last six months; three tracks (Ready for Disclosure, Minor Investigation, Larger Investigation) with escalation to the Safety Advisory Group; 27 affected summaries in the self-generated-instructions case; GPT-5.6 Sol training instances of instructions to conceal mistakes; exposed-API-key case followed by fabricated figures; agents uploading files to public hosting to cite them and to share between collaborating agents; quote "We do not believe that the AI industry has solved alignment and monitoring to a sufficient degree to continue responsibly scaling at maximum speed for much longer"; the Hugging Face incident would have fallen under the Larger Investigation track. Read via `scripts/fetch_openai.py` (direct fetch succeeded) |
| S13 | [Measurements for understanding the pace of AI development inside frontier labs](https://www.anthropic.com/institute/measuring-pace-of-ai-development) | Anthropic | lab blog | 2026-09-17 (per the anthropic.com newsroom listing; **the page itself carries no date**) | 2026-09-22 | Three proposed metrics: AI-Led R&D Automation Index on an AL0–AL5 scale, AI agent oversight, compute allocation. August 2026 figures: Claude "leads" 26% of Anthropic's AI R&D work, up from under 1% in February 2026; over 90% at "AI collaborates" or above; ~30,000 agents simultaneously; 100% action coverage; 0.002% blocked (~1 in 47,000); ~50 transcripts weekly escalated to human review. Compute allocation measured for **July 2026**: 6% of AI R&D compute to safety (12% of AI-driven AI R&D compute). The report states the dating caveat and the July/August split |
| S14 | [Partnering with Accenture on embedded evaluation](https://www.anthropic.com/news/accenture-embedded-evaluation) | Anthropic | lab blog | 2026-09-18 | 2026-09-22 | Faculty, Accenture's AI specialist business, as embedded evaluator with workplace-level access; evaluating and red-teaming models, alignment assessments, safeguard testing; monitoring during training and review of deployment decisions; at least $1bn over five years in evaluation capacity; non-exclusive, with dialogue ongoing with nonprofit evaluators including METR |
| S15 | [No plans have been confirmed regarding the reported talks between SK hynix and Intel on memory chip production in the U.S.](https://news.skhynix.com/en/fact-10/) | SK hynix | statement (primary) | 2026-09-16 | 2026-09-22 | Verbatim: "SK hynix is exploring various options to strengthen its global competitiveness, but no specific plans or arrangements have been finalized at this time. No decisions have been made regarding the two scenarios mentioned in the article." Used to hold the item to "reported negotiation, not a deal" |
| S16 | [SK Hynix reportedly in talks with Intel to build memory chips in US](https://techcrunch.com/2026/09/16/sk-hynix-reportedly-in-talks-with-intel-to-build-memory-chips-in-us/) | TechCrunch | press | 2026-09-16 | 2026-09-22 | Relays the Reuters report of two structures under discussion: leasing space at Intel's planned Ohio plant, or a joint venture that could include cloud-service providers. **Labelled in the report as reported, and paired with the company's own denial of finalisation (S15)** |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`, `statement (primary)`.

---

## 2. Also reviewed, not included

What was found and rejected, and why. Next week's Phase 0 reads this section.

### Opened and verified, cut for the page budget

| Item | URL | Why it did not make the issue |
|---|---|---|
| An Empirical Study of Harness Design for Coding Agents (2026-09-17) | https://arxiv.org/abs/2609.20804 | Opened and verified: Fan, R.-Z. et al.; 176 experiments across four models on SWE-Bench Verified and Terminal-Bench 2.1; context management matters more as the context budget tightens (fewer overflow failures); rule-based filtering plus LLM summarisation most efficient; planning shifted from propping up weak models to cutting cost for strong ones; bash-capable models effective with minimal tools at lower expense; 43 pages; **no code release stated**. Written into the issue, then cut whole when the build came in at 6 pages — the weakest of five papers because it ships no artifact. First candidate to reinstate |
| Anthropic, Life Sciences Verification Program (2026-09-17) | https://www.anthropic.com/news/life-sciences-verification-program | Opened and verified: verified life-science professionals get Mythos, Opus and Sonnet with safeguards more permissive for biology; standard tier renews annually and covers a team, project-specific high-risk tier removes life-sciences safeguards entirely and renews at six months; 30-day data retention for monitoring; "dozens of organizations" in early access, expects "hundreds within the first week"; Xaira Therapeutics, Edison Scientific and Manifold Bio testimonials; enterprise and team plans only. Cut first for the page budget — the industry section was at five items against the skill's 2–4 guidance |
| LimiX-2 arXiv report used as the lead rather than the weights | https://arxiv.org/abs/2609.17488 | Kept as S6 but demoted: the paper is dated 2026-09-15, one day outside the window, so the report leads on the 2026-09-16 weight release (S5) instead |

### Outside the seven-day window

| Item | URL | Why it did not make the issue |
|---|---|---|
| OpenAI, Responding to the next frontier of critical cyber capabilities | https://openai.com/index/responding-next-frontier-critical-cyber-capabilities/ | Opened via `fetch_openai.py`: dated **2026-08-07**. Cannot rule out Critical cyber capability for Astra under the Preparedness Framework; stricter security controls; pausing internal Astra activities that do not meet them. Six weeks outside the window |
| OpenAI, Introducing Trusted Access for Cyber | https://openai.com/index/trusted-access-for-cyber/ | Opened: dated **2026-02-05**. $10M in API credits for the Cybersecurity Grant Program; identity-based access at chatgpt.com/cyber. Seven months outside |
| OpenAI, Ten advances in mathematics and theoretical computer science | https://openai.com/index/ten-advances-in-mathematics/ | Opened: dated **2026-08-01**. Ten results from an internal Astra, ~$2,000 of tokens at Sol rates, Lean certificates. Outside the window; related Navier–Stokes coverage already ran in issue #04 |
| OpenAI, Tort Report: Abusive reporting activity | https://openai.com/index/disrupting-malicious-uses-of-ai-tort-report/ | The sitemap stamped this 2026-09-16, but the page itself is dated **2024-10-01** — a re-render, not a publication. A good example of why the sitemap dates are not trusted |
| Qwen-Image-2.0 (2026-02-10, Apache 2.0) | https://github.com/QwenLM/Qwen-Image | Outside the window; used only to establish that Qwen-Image-2.1 tightened the licence from Apache 2.0 to a research licence |
| MiniMax-H3 open weights | https://www.minimax.io/blog/minimax-h3 | Announced 2026-07-31, weights 2026-08-03; surfaced by search as if current. Well outside |
| Anthropic threat intelligence report; DeepSeek-V4.1-Flash launch; GPT-Live-1; Agents API; Paul Christiano board appointment | see issue #04 | All covered in issue #04 (9–15 September). Only the DeepSeek technical report (S10) returns, as a genuine follow-up carrying new architecture detail |
| NVIDIA–Hugging Face acquisition; Claude Fable 5.1 / Mythos 5.1; Gemini 3.8 Flash and Flash Cyber; Grok 4.6 | see issues #02–#04 | Already recorded; no reproduction, retraction or new artifact this week |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| Grok 4.7 described as "2.1 trillion parameters, up 40% from 1.5 trillion in Grok 4.6" | https://decrypt.co/378824/xai-launches-grok-4-7 and other secondaries | **Repeated across several secondaries but absent from xAI's own page**, which states no parameter count. Not asserted; the report says explicitly that xAI publishes neither a parameter count nor a context window |
| Grok 4.7 safety figures: 62.4% biosafety benchmark, 3.3% risky-prompt allowance, "entirely new safeguard stack" | https://x.ai/news/grok-4-7 | These are on the primary page and are verified, but are xAI self-reported with no named benchmark version or external evaluator. Cut rather than give a safety claim a sentence it has not earned |
| TCS 1 GW AI data centre in Hyderabad, ~$7.4bn; Nexperia–Tata partnership at SEMICON India (2026-09-17) | search snippets only | Surfaced through an aggregated digest; no company primary was opened. Not used |
| "Carolina Principles" — US securing G20 support including China for light-touch AI rules, September 2026 | https://cubbbix.com/blog/ai-regulation-september-2026-global-update | Aggregator only, no gazette, communiqué or government primary found. Not used |
| EU AI Office beginning high-risk audits with 24 national market-surveillance authorities in September 2026; CNIL/BfDI/AESIA sector focus | https://artificialintelligenceact.eu/ and secondaries | No in-window primary (no Commission or authority publication with a date inside 16–22 September) was located. **The policy beat therefore rests on the lab-governance items (S12–S14), not on regulation** |
| Nvidia $100bn investment in OpenAI / 10 GW deployment; Google $40bn at $350bn valuation with Anthropic; Amazon $25bn | https://aiweekly.co/ai-news-today and similar digests | Undated or vaguely dated aggregator claims of enormous size. None was traced to a filing or company release inside the window; carrying them on a digest's word would be exactly the error this brief exists to avoid |
| LMArena Elo standings and "crown changes" | https://lmarena.ai (unreachable) and llm-stats / benchlm aggregators | LMArena itself remains unreachable from this environment; the aggregators disagreed with each other (Opus 4.8 at 1510 vs Opus-5-max at 1505 for the same month). No Elo figure is used anywhere in the issue |

### Papers surfaced on Hugging Face daily papers (16–22 September) but not opened

| Item | URL | Why it did not make the issue |
|---|---|---|
| 2609.19134 (ScienceIDE), 2609.18708 (Critic Learning in PPO), 2609.17708 (Experiential Confidence), 2609.18805 (ProgramDistill), 2609.18094 (Agora), 2609.15810 (VC-Attention), 2609.18487 (ActionPiece), 2609.17909 (Zing-0.5), 2609.14320 (SpectralShift), 2609.14306 (Long-Context MoE memory peaks), 2609.17652 (Fathom), 2609.20800 (JEPA-Anything), 2609.19656 (Self-Evolving Search Index), 2609.20784 (RetireOPD), 2609.20612 (Privileged Information in Self-Distillation), 2609.15779 (EvoOntology), 2609.22068 (CodeMidas), 2609.22000 (RecreationWorld), 2609.22966 (VLM→Robotic Control), 2609.24984 (WorldCrafter), 2609.24972 (RRSI), 2609.21619 (Teacher–Student Discrepancy), 2609.24432 (Gradient Estimation in On-Policy Distillation) | https://huggingface.co/papers | Seen on the 17, 18, 21 and 22 September rankings. Lower relevance than the four selected, or inside the same on-policy-distillation cluster already represented by S11. Logged so next week knows they were seen |
| 2609.20519 stablemates: 2609.18323 (MiniMax-H3 physical-world evaluation, 104 votes), 2609.16900 (RiskChainBench), 2609.18605 (PACT) | https://huggingface.co/papers | Benchmarks and evaluations rather than results; the benchmark section was already committed to the Grok 4.7 table |

---

## 3. Method

- **Window:** the seven days ending 2026-09-22, inclusive (2026-09-16 to 2026-09-22).
- **Beats swept:** releases, research, benchmarks, industry/policy. Roughly 60 candidates
  were surfaced across the four beats; 16 sources back the 12 items that survived selection.
- **One item sits outside the window and says so in the body text.** Gemini 3.8 Live and
  3.8 Live Extended Thinking are dated 2026-09-15, one day before the window. They are
  carried because issue #04 swept 9–15 September and explicitly recorded finding no
  in-window model from Google — this was the miss. LimiX-2's paper is likewise dated
  2026-09-15, but its **weight release is 2026-09-16**, inside the window, so the item
  leads on the weights.
- **Verification:** every figure, identifier and date in the report was read from the
  linked source on 2026-09-22. All four arXiv identifiers were copied from abstract pages
  that were fetched individually. The Grok 4.7 benchmark table was transcribed from
  xAI's own page, not from any secondary summary of it.
- **Self-reported versus independent:** the Grok 4.7 table (S1), the LimiX-2 Elo figures
  (S5) and the Gemini 3.8 Live audio scores (S7) are vendor self-reports and are labelled
  as such in the report. The only independent measurement used is the Artificial Analysis
  Intelligence Index for Grok 4.7 (S2).
- **Left out for lack of verification:** the widely repeated Grok 4.7 parameter count
  (absent from xAI's page); every in-window regulatory lead (no primary found); the very
  large infrastructure-investment figures circulating in digests; all LMArena Elo numbers.
- **Known gaps:** `x.ai/news` (the index) returns 403 to the fetch tool, though the
  individual post `x.ai/news/grok-4-7` fetches cleanly — go straight to the slug.
  `fetch_openai.py --since` again stamped every slug with the crawl date (2026-09-22), so
  in-window OpenAI pages were found by reading the "Keep reading" rails of pages that did
  fetch, which is how the 16 September misalignment framework surfaced. **The sitemap date
  is not a publication date**: `disrupting-malicious-uses-of-ai-tort-report` was stamped
  2026-09-16 but is a 2024 page. `qwen.ai/blog` renders client-side and returned an empty
  document; the GitHub repo and Hugging Face card were used as the Qwen primaries instead.
  The Anthropic Institute page carries no visible publication date; it is dated here from
  the anthropic.com newsroom listing and the report states that caveat.
- **Quiet beat:** no in-window model release was found from Meta, Mistral, Microsoft,
  Cohere or AI2. The report does not claim there was none, only that none was found.
