# Third-Party Components and Licenses

This project is an **orchestration and integration platform** that assembles multiple open-source components. Each component retains its original license.

## 📋 Component Inventory

### Frontend Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **React** | 19.x | MIT | UI framework |
| **CoreUI** | 5.x | MIT | Dashboard components |
| **Vite** | Latest | MIT | Build tool |

### Backend Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **Python** | 3.11 | PSF | Runtime |
| **Flask** | Latest | BSD-3-Clause | Web framework |
| **Gunicorn** | Latest | MIT | WSGI server |
| **n8n** | Latest | Fair-code (Sustainable Use License) | Workflow automation |

### AI/ML Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **Ollama** | Latest | MIT | LLM runtime |
| **Mistral 7B** | Latest | Apache 2.0 | Language model |
| **Llama 3.1** | Latest | Llama 3 Community License | Language model |
| **Qdrant** | Latest | Apache 2.0 | Vector database |

### Data Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **PostgreSQL** | 16+ | PostgreSQL License | Relational DB |
| **pgvector** | Latest | PostgreSQL License | Vector extension |
| **MongoDB** | Latest | SSPL 1.0 | Document DB |
| **Redis** | Latest | BSD-3-Clause | Cache/Queue |

### Observability Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **Prometheus** | Latest | Apache 2.0 | Metrics collection |
| **Grafana** | Latest | AGPLv3 | Visualization |
| **Loki** | Latest | AGPLv3 | Log aggregation |
| **Promtail** | Latest | AGPLv3 | Log shipper |
| **cAdvisor** | Latest | Apache 2.0 | Container metrics |
| **Node Exporter** | Latest | Apache 2.0 | System metrics |

### Infrastructure Layer
| Component | Version | License | Purpose |
|-----------|---------|---------|---------|
| **Docker** | 24+ | Apache 2.0 | Containerization |
| **Docker Compose** | v2.20+ | Apache 2.0 | Orchestration |
| **Caddy** | Latest | Apache 2.0 | Reverse proxy |

## ⚖️ License Compatibility

### Permissive Licenses (Compatible)
- **MIT** - Most permissive, allows commercial use
- **Apache 2.0** - Permissive with patent protection
- **BSD-3-Clause** - Permissive with attribution
- **PostgreSQL License** - Similar to MIT

### Copyleft Licenses (Disclosure requirements)
- **AGPLv3** - Grafana, Loki (network copyleft - requires source disclosure if modified and served over network)
- **SSPL** - MongoDB (cloud service restriction - cannot offer as managed service)

### Fair-code
- **Sustainable Use License** - n8n (free for internal use, restrictions on competitive SaaS)

## ✅ Compliance Strategy

### What This Project DOES
- ✅ Orchestrates pre-built components via Docker Compose
- ✅ Provides custom integration code (MIT licensed)
- ✅ Creates original documentation (MIT licensed)
- ✅ Adds custom APIs and workflows (MIT licensed)
- ✅ Uses components AS-IS without modification

### What This Project DOES NOT DO
- ❌ Modify Grafana/Loki source code (would trigger AGPLv3 disclosure)
- ❌ Offer MongoDB as a managed service (would violate SSPL)
- ❌ Redistribute n8n commercially (Sustainable Use License restriction)
- ❌ Claim ownership of third-party components

## 📜 MIT License Scope (This Project)

The **MIT License** in this repository applies ONLY to:
- Docker Compose orchestration files (`docker/compose/*.yml`)
- Custom scripts (`Makefile`, `scripts/*`, `automation/*`)
- Custom backend code (`backend/*.py` - original code)
- Custom frontend code (original React components)
- Configuration files (Caddy, Prometheus configs)
- Documentation (`docs/*.md`, `README.md`, etc.)

## 🔗 License Links

- **MIT**: https://opensource.org/licenses/MIT
- **Apache 2.0**: https://www.apache.org/licenses/LICENSE-2.0
- **AGPLv3**: https://www.gnu.org/licenses/agpl-3.0.html
- **SSPL**: https://www.mongodb.com/licensing/server-side-public-license
- **PostgreSQL**: https://www.postgresql.org/about/licence/
- **BSD-3-Clause**: https://opensource.org/licenses/BSD-3-Clause

## 📢 Attribution

This project is built on the shoulders of giants. We are grateful to all open-source contributors whose work makes this platform possible.

---

*Last updated: February 2026*
