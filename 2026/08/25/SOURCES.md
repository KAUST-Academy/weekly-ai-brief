# Sources — Weekly AI Brief #01
**Window covered:** 2026-08-19 to 2026-08-25 (7 days)
**Compiled:** 2026-08-25 by Ali Habibullah
**Report:** `report.pdf` (5 pages)

---

## 1. Cited sources

Numbering matches `\srcref{n}` in `report.tex` exactly, both directions.

| # | Title | Org / publisher | Type | Published | Accessed | Supports |
|---|---|---|---|---|---|---|
| S1 | [DeepSeek-V4-Flash-Vision-Exp release note](https://api-docs.deepseek.com/news/news260821) | DeepSeek | documentation | 2026-08-21 | 2026-08-25 | Release date; image billing at up to 384 tokens each on the V4-Flash rate card; API-only availability (Chat Completions / Messages / Responses, base64 / URL / Files API); no weights; the self-reported "close to Opus-4.8" multimodal-agent claim |
| S2 | [Newsroom: Groq 3 LPX full production; Vera Rubin NVL72; SpaceXAI Vera CPU](https://nvidianews.nvidia.com/news) | NVIDIA | press | 2026-08-24 | 2026-08-25 | Groq 3 LPX entering full production; the "up to 30× more work per watt" Vera Rubin NVL72 claim; SpaceXAI adopting the Vera CPU |
| S3 | [SWE Refactor Bench: Can Coding Agents Complete a Long-Horizon, Whole-Repository Stack Migration?](https://arxiv.org/abs/2608.23564) | Hong, D. et al. (arXiv:2608.23564) | paper | 2026-08-24 | 2026-08-25 | 28/520 runs (5.4%) pass all three stages; `claude-opus-5` best at 47.0/100; 13 of 20 tasks with no accepted solution; 31.4 build-toolchain vs 5.6 language-rewrite; 8 models across 26 model-effort configurations; the "Blindness" failure mode and three-stage protocol |
| S4 | [Prime Agent: A Self-Improving RLM Harness](https://arxiv.org/abs/2608.23552) | Karten, S. et al. (arXiv:2608.23552) | paper | 2026-08-24 | 2026-08-25 | ARC-AGI-3 RHAE Best@1 from 30% to 95.5%; persistent IPython REPL / RLM abstraction; persistence of histories, memories, skills, prompts, subagent specs; code at github.com/PrimeIntellect-ai/prime-agent under CC BY 4.0 |
| S5 | [Apodex 1.1: Scaling Agentic Intelligence for Complex Work](https://arxiv.org/abs/2608.23283) | Apodex Team, 70 authors (arXiv:2608.23283) | paper | 2026-08-24 | 2026-08-25 | Environment Scaling and Agentic Coordination Scaling definitions; shared execution harness and AgentOS; 35B Apodex 1.1 Mini variant; the unquantified "leading performance band" claim |
| S6 | [On the Threat Model of Weird Generalization and Emergent Misalignment](https://arxiv.org/abs/2608.23476) | Wanner, M., Dredze, M. & Walden, W. (arXiv:2608.23476) | paper | 2026-08-24 | 2026-08-25 | Dependence on dataset composition and language more than size; stronger effect on familiar vs novel data; sensitivity to evaluation-question choice; the adversarial-threat rather than inherent-hazard conclusion |
| S7 | [MobilePA-Bench: Benchmarking Mobile Planner Agents on Complex Real-World Tasks](https://arxiv.org/abs/2608.23035) | Zhu, Y. et al. (arXiv:2608.23035) | paper | 2026-08-24 | 2026-08-25 | Executable sandbox with live application databases; 13 functional domains and 212 tools; sub-agent collaboration / memory / pre-packaged skills; frontier-LLM unreliability under strict tool ordering, permission limits and runtime errors |
| S8 | [ReWorld: An Interactive World Model with Long-Horizon Memory](https://arxiv.org/abs/2608.23565) | Chen, Z. et al. (arXiv:2608.23565) | paper | 2026-08-24 | 2026-08-25 | Mixed attention windows with global heads; pose-indexed landmark bank on fixed inference budget; 11.95° rotation error; 64-second out-and-back rollouts; 704×1280 output; comparison against six recent interactive world models |
| S9 | [EchoWM: Open and Enterable Omnimodal World Models](https://arxiv.org/abs/2608.23189) | Zhang, S. et al. (arXiv:2608.23189) | paper | 2026-08-24 | 2026-08-25 | Interactive 720p video with environmental sound, music and speech; shared trajectory system unifying discrete and continuous control across first- and third-person scenes |
| S10 | [Alibaba to issue HK$80 billion in new shares for global AI push](https://www.scmp.com/tech/big-tech/article/3364957/alibaba-issue-hk80-billion-new-shares-global-ai-push) | South China Morning Post | press | 2026-08-23 | 2026-08-25 | HK$80bn / US$10.2bn placement on 23 August; stated use of proceeds for full-stack AI capability including AI infrastructure |
| S11 | [Poolside Strikes $6 Billion Licensing Deal with Nvidia](https://www.newcomer.co/p/sources-poolside-strikes-6-billion) | Newcomer | press | 2026-08-20 | 2026-08-25 | $6bn Model Factory licence; $1bn Nvidia investment; $12bn pre-money valuation; sourcing from a letter to investors, reported exclusively |
| S12 | [Daily Papers, 25 August 2026](https://huggingface.co/papers) | Hugging Face | leaderboard | 2026-08-25 | 2026-08-25 | The community ranking used to surface research candidates (discovery only — no figure in the report rests on it) |

Type is one of: `paper`, `lab blog`, `model card`, `leaderboard`, `press`, `filing`,
`regulation`, `documentation`.

---

## 2. Also reviewed, not included

What was found and rejected, and why. Next week's Phase 0 reads this section.

### Outside the seven-day window

| Item | URL | Why it did not make the issue |
|---|---|---|
| Anthropic Risk Report: August 2026 (186pp; misalignment risk raised to "low", unreleased Model 2, bio-classifier gap) | https://www.anthropic.com/aug-2026-risk-report | Outside the window (published 2026-08-14). Substantial; revisit only if a reproduction or response lands |
| Anthropic × Google × Broadcom, 3.5 GW TPU capacity | https://www.anthropic.com/news/google-broadcom-partnership-compute | Outside the window (published 2026-04-06). Search snippets described it as "announced Monday" and nearly pulled it in — the primary page carries the April date |
| FLI AI Safety Index, Summer 2026 (no lab above C+) | https://futureoflife.org/ai-safety-index-summer-2026/ | Outside the window (published July 2026) |
| Meta Muse Glimmer, 30B, Apache 2.0 | https://huggingface.co/blog/muse-glimmer | Outside the window (released 2026-08-10) |
| Qwen3.8-27B; GLM-5.3; GLM-5.2 Turbo | https://huggingface.co/models?sort=trending | Outside the window (2026-08-14 and 2026-08-17). Qwen3.8-27B still dominates HF trending, but trending is not news |
| Gemini 3.7 Flash; DeepSeek-V4-Pro-0813 | https://llm-stats.com/ai-news | Outside the window (2026-08-13) |
| Grok 4.6; LFM2.5-VL-3B; Cohere North Micro Vision Instruct; Qwen3.8-2.4T-A95B | https://llm-stats.com/ai-news | Outside the window (2026-08-12) |
| MiniMax H3 open weights | https://comfyui-wiki.com/en/news/2026-08-03-minimax-h3-open-weights-comfyui | Outside the window (2026-08-03) |
| Unit 42, autonomous AI cyberattack campaign via DeepSeek/Hermes | https://unit42.paloaltonetworks.com/autonomous-ai-cyber-attack-campaign/ | Outside the window (published 2026-07-30) |
| EU AI Act transparency obligations; California SB 942 | https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai | Both bound on 2026-08-02, outside the window |
| HUMAIN Arabic conversational AI app launch | https://www.middleeastainews.com/p/us-approves-up-to-70000-advanced | 2025 item resurfaced by an undated query; not this window |

### In window, but not verifiable to a primary source

| Item | URL | Why it did not make the issue |
|---|---|---|
| TeamT5: Chinese state-linked groups "more than doubled" attack volume using DeepSeek | https://www.bloomberg.com/news/articles/2026-08-24/chinese-hackers-use-deepseek-to-boost-attacks-researchers-say | Dated 2026-08-24 and genuinely in window, but Bloomberg is paywalled and the secondary (implicator.ai) failed twice with ECONNRESET. No page carrying the figure could be opened, so the claim was dropped rather than relayed from a snippet. **Worth retrying next week** |
| Hugging Face exploring a sale at $13bn+ | https://techstartups.com/2026/08/24/top-tech-news-today-august-24-2026-alibaba-amazon-hugging-face-nvidia-xpeng-more/ | Aggregator-only; the originating reporter could not be identified, so the "reportedly" chain could not be preserved intact |
| Nvidia in talks to invest in Perplexity at $30bn+ | https://techstartups.com/2026/08/24/top-tech-news-today-august-24-2026-alibaba-amazon-hugging-face-nvidia-xpeng-more/ | Rumour stage, aggregator-only. Fails the "still true in a month" test |
| LMArena / Chatbot Arena Elo standings | https://lmarena.ai/leaderboard | lmarena.ai 301-redirects to arena.ai, and neither fetched page contained leaderboard data. Aggregator copies disagreed with each other on both the leader and the score, so no Elo figure is quoted anywhere in this issue |
| Alibaba Form 6-K (share count, price per share) | https://www.sec.gov/Archives/edgar/data/0001577552/000119312526361715/baba-ex99_1.htm | SEC returned HTTP 403. The 710m-shares-at-HK$112.70 detail was therefore omitted; only the HK$80bn/US$10.2bn total, confirmed via S10, is stated |
| Poolside engineer headcount moving to Nvidia (100+ / 109) | https://www.forbes.com/sites/jonmarkman/2026/08/24/nvidia-pays-poolside-6b-to-license-its-model-factory-and-109-workers/ | The Newcomer piece (S11) that broke the deal does not carry the headcount in the accessible portion; secondary figures disagreed (100+ vs 109), so no number is given |
| Nvidia–Perplexity, XPeng robotics $900m, Amazon device price rises, nVent–Maverick, Xiaomi chip spend | https://techstartups.com/2026/08/24/top-tech-news-today-august-24-2026-alibaba-amazon-hugging-face-nvidia-xpeng-more/ | Either aggregator-only or not close enough to AI model/infrastructure practice to earn a slot |
| arXiv:2608.16812, 2608.20958, 2608.20430, 2608.19567, 2608.13622 | https://huggingface.co/papers | Surfaced on the HF ranking but not opened; lower relevance to the audience than the six papers selected. Listed so next week knows they were seen |

### Beats that could not be swept

| Item | URL | Why |
|---|---|---|
| OpenAI newsroom | https://openai.com/news/ | HTTP 403 on fetch. This beat is a gap in this issue — if OpenAI shipped in-window, this brief would have missed it |
| Qwen official blog | https://qwenlm.github.io/blog/ | Fetched page listed no 2026 posts (most recent visible: September 2025); Qwen releases were tracked via HF trending instead |
| Google AI blog | https://blog.google/technology/ai/ | Fetched page carried no per-post publication dates, so nothing could be placed in or out of the window |
| Artificial Analysis intelligence index | https://artificialanalysis.ai/ | Leaderboard values not present in the fetched page; only the v4.1.1 benchmark composition and recently-added model names were readable |

---

## 3. Method

- **Window:** the seven days ending 2026-08-25, inclusive (2026-08-19 to 2026-08-25).
- **Beats swept:** releases, research, benchmarks, industry/policy. Roughly 30 candidates
  were surfaced; 12 sources back the 12 items that survived selection.
- **Verification:** every figure, identifier and date in the report was read from the
  primary source linked above on the accessed date. No claim rests on a search snippet.
  All twelve arXiv identifiers were copied from abstract pages that were fetched, never
  reconstructed. Two items initially looked in-window from search results and were killed
  on reading the primary — the Anthropic/Broadcom compute deal (April) and the Unit 42
  cyber campaign (July).
- **Left out for lack of verification:** the TeamT5 attack-volume figure (paywalled
  primary, secondary unreachable), the Hugging Face and Perplexity deal rumours
  (aggregator-only), all LMArena Elo numbers (no reachable primary), and Alibaba's
  per-share placement terms (SEC 403). Each is listed in section 2 with what was missing.
- **Known gaps:** the OpenAI newsroom returned 403 and could not be swept at all, which is
  the largest hole in this issue. The Qwen and Google blogs returned pages without usable
  dates. Policy was genuinely quiet in-window — the month's binding dates fell on 2 August
  — so the report says so in one line rather than padding the section.
- **Prior issues:** none. This is issue #01, so no de-duplication against earlier coverage
  was possible. From issue #02 onward, this file is the input to Phase 0.
