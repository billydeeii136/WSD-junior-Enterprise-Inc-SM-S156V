# API KEY VALIDATION REPORT — 2026-06-28
## Live Provider Tests — All Keys from BYOK Inventory

| Provider | Key | Status | Details |
|----------|-----|--------|---------|
| OpenAI | OPENAI_API_KEY | ✅ WORKING | Models endpoint returned text-embedding-ada-002, gpt-4, etc. |
| Anthropic | ANTHROPIC_API_KEY | ✅ WORKING | Key valid, requires `anthropic-version` header in requests |
| DeepSeek | DEEPSEEK_API_KEY | ✅ WORKING | deepseek-v4-flash, deepseek-v4-pro models returned |
| Mistral | MISTRAL_API_KEY | ✅ WORKING | mistral-medium-2505, mistral-large-2512, etc. |
| Cohere | COHERE_API_KEY | ✅ WORKING | command-a, c4ai-aya-expanse-32b, etc. |
| OpenRouter | OPENROUTER_API_KEY | ✅ WORKING | owl-alpha, fusion, pareto-code models returned |
| Together | TOGETHER_API_KEY | ✅ WORKING | Account: team_ZAAPoPURBYh3Y9BKziHVwyYm, deployment active |
| DigitalOcean | DIGITALOCEAN_ACCESS_TOKEN | ✅ WORKING | No droplets (empty account), auth valid |
| Linode | LINODE_API_TOKEN | ✅ WORKING | No instances, auth valid |
| Vercel | VERCEL_API_TOKEN | ✅ WORKING | creator-platform-frontend project active, multiple domains |
| Netlify | NETLIFY_API_TOKEN | ❌ NOT FOUND | Token invalid or endpoint changed — verify in Netlify dashboard |
| Scaleway | SCALEWAY_API_TOKEN | ❌ NOT FOUND | Token invalid or endpoint changed — verify in Scaleway console |
| Google | GOOGLE_API_KEY | ❌ 401 UNAUTHENTICATED | Key invalid, restricted, or APIs not enabled — regenerate in Cloud Console |

## Missing Keys (Not Tested)
- AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY
- AZURE_OPENAI_API_KEY
- GCP_SERVICE_ACCOUNT_JSON
- IBM_CLOUD_API_KEY
- CLOUDFLARE_API_TOKEN
- PORKBUN_API_KEY / PORKBUN_SECRET_API_KEY
- SCW_SECRET_KEY
- WARP_API_KEY
- GITHUB_TOKEN (broken placeholder)

## Action Required
1. Regenerate GOOGLE_API_KEY in Google Cloud Console (IAM & Admin → Credentials)
2. Verify NETLIFY_API_TOKEN in Netlify dashboard (User Settings → Applications → Personal Access Tokens)
3. Verify SCALEWAY_API_TOKEN in Scaleway console (IAM → API Keys)
4. Generate missing keys for AWS, Azure, GCP, IBM, Cloudflare, Porkbun as needed
5. Regenerate GITHUB_TOKEN with repo, gist, workflow, read:org scopes
