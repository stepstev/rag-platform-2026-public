# 🛠️ Tech Stack - OceanP RAG Platform

> **Stack technologique moderne et éprouvée**

---

## 📊 Vue d'Ensemble

```
┌─────────────────────────────────────────────────────┐
│  Frontend         React 19 • CoreUI 5 • Vite        │
├─────────────────────────────────────────────────────┤
│  Backend          Python 3.11 • Flask • Gunicorn   │
├─────────────────────────────────────────────────────┤
│  AI/ML            Ollama • LangChain • Qdrant       │
├─────────────────────────────────────────────────────┤
│  Data             PostgreSQL • MongoDB • Redis      │
├─────────────────────────────────────────────────────┤
│  Ops              Prometheus • Grafana • Loki       │
├─────────────────────────────────────────────────────┤
│  Infra            Docker • Compose • Caddy          │
└─────────────────────────────────────────────────────┘
```

---

## 🎨 Frontend & Présentation

### Core Stack

| Technologie | Version | Rôle |
|-------------|---------|------|
| **React** | 19.x | Framework UI moderne |
| **CoreUI** | 5.x | Design system professionnel |
| **Vite** | 5.x | Build tool ultra-rapide |
| **React Router** | 6.x | Routing SPA |
| **Axios** | 1.x | HTTP client |

### Interfaces Utilisateur

**Dashboard Principal (React + CoreUI)**
- Monitoring système temps réel
- Architecture interactive (diagrammes Mermaid)
- Gestion services (start/stop/status)
- Portail unifié

**Open WebUI**
- Interface chat conversationnelle
- RAG intégré natif
- Upload documents
- Gestion modèles LLM

**LibreChat**
- Alternative chat multi-modèles
- Support OpenAI-compatible APIs
- Historique conversations
- RAG avec pgvector

### Justification Choix

✅ **React 19** : Concurrent rendering, Suspense, Server Components ready  
✅ **CoreUI 5** : Design system complet, responsive, thème dark/light  
✅ **Vite** : Build 10x plus rapide que Webpack, HMR instantané  

---

## ⚙️ Backend & APIs

### Core Stack

| Technologie | Version | Rôle |
|-------------|---------|------|
| **Python** | 3.11+ | Langage principal |
| **Flask** | 3.x | Framework web léger |
| **Gunicorn** | 21.x | WSGI server production |
| **psutil** | 5.x | Métriques système |
| **requests** | 2.x | HTTP client |

### APIs Développées

**System Metrics API**
- Endpoint `/api/system-metrics`
- Collecte CPU, RAM, disque, réseau
- Intégration Prometheus exporter
- CORS configuré pour Power BI

**Stack Observability API**
- Endpoint `/api/stack/status`
- Agrégation santé microservices
- Export JSON pour dashboards externes
- Webhook pour alerting

**Mission Factory API**
- Upload documents
- Génération contenu IA
- Export multi-formats (PDF, DOCX)
- Workflow validation

### Justification Choix

✅ **Flask** : Léger, flexible, adapté microservices  
✅ **Gunicorn** : Production-grade, workers multi-process  
✅ **Python 3.11** : Performance +25% vs 3.10, type hints améliorés  

---

## 🤖 AI & Machine Learning

### LLM Stack

| Composant | Technologie | Modèles |
|-----------|-------------|---------|
| **LLM Server** | Ollama | Mistral 7B, Llama 3.1 70B, Phi3, Qwen 2.5 |
| **Embeddings** | nomic-embed-text | 768 dimensions, local |
| **Vector DB** | Qdrant | HNSW index, cosine similarity |
| **Orchestration** | LangChain | RAG pipeline, memory |

### Modèles Disponibles

**LLMs Génératifs**
- **Mistral 7B** (4.1 GB) — Raisonnement général, multilingue
- **Llama 3.1 70B** (42 GB) — Haute performance, raisonnement complexe
- **Phi3 3.8B** (2.2 GB) — Léger, rapide, efficace
- **Qwen 2.5 32B** (19 GB) — Expertise chinoise, multilingual

**Embeddings**
- **nomic-embed-text** (274 MB) — Open source, performant, local

### Pipeline RAG

```python
# Conceptuel (simplifié)
from langchain import Ollama, Qdrant
from langchain.chains import RetrievalQA

# 1. Embedding model
embeddings = OllamaEmbeddings(model="nomic-embed-text")

# 2. Vector store
vectorstore = Qdrant(
    collection_name="documents",
    embeddings=embeddings
)

# 3. LLM
llm = Ollama(model="mistral:7b")

# 4. RAG Chain
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    retriever=vectorstore.as_retriever(k=5)
)

# 5. Query
response = qa_chain.run("Votre question ici")
```

### Justification Choix

✅ **Ollama** : 100% local, pas d'API externe, souverain  
✅ **Mistral 7B** : Meilleur rapport qualité/performance pour CPU  
✅ **Qdrant** : Open source, performant, filtres avancés  
✅ **nomic-embed-text** : Gratuit, performant, multilingual  

---

## 💾 Données & Persistance

### Bases de Données

| Type | Technologie | Usage |
|------|-------------|-------|
| **Relationnel** | PostgreSQL 16 + pgvector | Embeddings LibreChat, données structurées |
| **Documentaire** | MongoDB 7 | Conversations, JSON documents |
| **Vectoriel** | Qdrant | Embeddings RAG, recherche sémantique |
| **Cache** | Redis 7 | Sessions, queue, rate limiting |

### Extensions PostgreSQL

```sql
CREATE EXTENSION vector;  -- pgvector pour embeddings
CREATE EXTENSION pg_stat_statements;  -- Performance monitoring
```

### Justification Choix

✅ **PostgreSQL** : Robuste, ACID, extensions riches (pgvector)  
✅ **MongoDB** : Schemaless, adapté conversations/logs  
✅ **Qdrant** : Spécialisé vector search, meilleures perfs que pgvector seul  
✅ **Redis** : Ultra-rapide, TTL natif, pub/sub  

---

## 📊 Observabilité & Monitoring

### Stack Complète

| Composant | Technologie | Rôle |
|-----------|-------------|------|
| **Métriques** | Prometheus | Time-series DB, scraping |
| **Dashboards** | Grafana | Visualisation temps réel |
| **Logs** | Loki + Promtail | Agrégation logs centralisée |
| **Containers** | cAdvisor | Métriques Docker |
| **Système** | node-exporter | CPU, RAM, disque, réseau |

### Dashboards Grafana

**1. RAG Platform 360°**
- Vue globale stack
- Santé services
- Métriques clés
- Alertes actives

**2. System Health**
- CPU usage (user, system, iowait)
- Memory (used, cache, swap)
- Disk I/O, latency
- Network throughput

**3. Docker Containers**
- Ressources par container
- Logs en temps réel
- Restart count
- Health checks

### Métriques Exportées

```yaml
# Exemples Prometheus metrics

# Système
node_cpu_seconds_total
node_memory_MemAvailable_bytes
node_disk_io_time_seconds_total
node_network_receive_bytes_total

# Containers
container_cpu_usage_seconds_total
container_memory_usage_bytes
container_network_receive_bytes_total

# Applicatives (custom)
http_requests_total{endpoint="/api/health"}
rag_query_duration_seconds{model="mistral"}
vector_search_latency_seconds{collection="documents"}
```

### Justification Choix

✅ **Prometheus** : Standard industrie, query language puissant (PromQL)  
✅ **Grafana** : Dashboards riches, alerting intégré, multi-sources  
✅ **Loki** : "Prometheus for logs", query language similaire (LogQL)  

---

## 🔄 Automation & Orchestration

### n8n Workflow Automation

| Feature | Usage |
|---------|-------|
| **Workflows visuels** | Drag & drop, 500+ nodes |
| **Déclencheurs** | Webhook, cron, email, file watcher |
| **Intégrations** | Notion, Slack, APIs REST, databases |
| **Custom nodes** | Python/TypeScript pour logique métier |

### Exemples Workflows

**Veille Automatisée**
```
RSS Feed → Text Extraction → Ollama Summarization → 
Slack Notification → Notion Archive
```

**Monitoring Proactif**
```
Prometheus Alert → Context Collection → LLM RCA → 
Slack Alert + Runbook Suggestion
```

**Document Pipeline**
```
File Upload (S3/local) → Text Extraction → Chunking → 
Embedding → Qdrant Indexing → Notification
```

### Justification Choix

✅ **n8n** : Open source, self-hosted, UI intuitive  
✅ **Intégrations natives** : Ollama, databases, APIs  
✅ **Webhooks** : Déclenchement externe facile  

---

## 🐳 Infrastructure & Déploiement

### Containerisation

| Technologie | Version | Rôle |
|-------------|---------|------|
| **Docker** | 24+ | Containerisation |
| **Docker Compose** | v2.20+ | Orchestration multi-containers |
| **Caddy** | 2-alpine | Reverse proxy + HTTPS auto |

### Architecture Docker

```yaml
# Conceptuel docker-compose.yml (simplifié)
services:
  # Frontend
  frontend:
    build: ./frontend
    ports: ["3001:80"]
    networks: [edge]
  
  # Backend APIs
  system-api:
    build: ./backend
    expose: ["5001"]
    networks: [internal, ops]
  
  # AI
  ollama:
    image: ollama/ollama:latest
    volumes: [ollama-data:/root/.ollama]
    networks: [ai, internal]
  
  # Data
  qdrant:
    image: qdrant/qdrant:latest
    volumes: [qdrant-data:/qdrant/storage]
    networks: [data, internal]
  
  # Monitoring
  prometheus:
    image: prom/prometheus:latest
    volumes: [prom-data:/prometheus]
    networks: [ops]

volumes:
  ollama-data:
  qdrant-data:
  prom-data:

networks:
  edge:
  internal:
  ai:
  data:
  ops:
```

### Stratégie Build

**Multi-stage Dockerfiles**
```dockerfile
# Frontend (exemple)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
```

**Backend**
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["gunicorn", "-w", "4", "app:app"]
```

### Justification Choix

✅ **Docker Compose** : Simplicité vs Kubernetes pour 1 serveur  
✅ **Caddy** : HTTPS auto, config simple, reverse proxy léger  
✅ **Multi-stage builds** : Images finales légères (-60% taille)  

---

## 🔐 Sécurité & Secrets

### Gestion des Secrets

```bash
# .env (jamais commité)
POSTGRES_PASSWORD=$(openssl rand -hex 32)
JWT_SECRET=$(openssl rand -hex 32)
GRAFANA_ADMIN_PASSWORD=$(openssl rand -hex 12)
```

### Pratiques Appliquées

- ✅ `.gitignore` strict (`.env`, secrets, logs)
- ✅ Génération automatique secrets (Makefile)
- ✅ Variables d'environnement (12-factor app)
- ✅ Pas de credentials hardcodés dans le code
- ✅ Rotation secrets facilitée

---

## 📈 Performances & Optimisations

### CPU/RAM Optimization

| Service | CPU Limit | RAM Limit | Justification |
|---------|----------|-----------|---------------|
| Ollama | 4.0 CPU | 10 GB | LLM inference intensif |
| PostgreSQL | 2.0 CPU | 2 GB | Queries + index |
| Qdrant | 2.0 CPU | 4 GB | Vector search |
| Redis | 1.0 CPU | 512 MB | Cache léger |
| Prometheus | 1.0 CPU | 2 GB | Time-series agregation |

### Caching Strategy

```
Browser → CDN → Caddy (reverse proxy) → APIs
           ↓
      Redis Cache (sessions, queries fréquentes)
           ↓
      Databases (PostgreSQL, MongoDB, Qdrant)
```

---

## 🚀 Évolutions Technologiques

### Court Terme (3-6 mois)
- [ ] Migration React Server Components
- [ ] WebSockets temps réel (notifications)
- [ ] GPU acceleration (CUDA pour Ollama)

### Moyen Terme (6-12 mois)
- [ ] Kubernetes migration (scalabilité)
- [ ] Object storage (S3-compatible)
- [ ] Service mesh (Istio/Linkerd)

### Long Terme (12+ mois)
- [ ] Edge deployment (ARM64)
- [ ] Multi-region (géo-distribution)
- [ ] Federated learning (LLM fine-tuning)

---

## 📚 Ressources & Références

### Documentation Officielle
- [Docker](https://docs.docker.com/)
- [React](https://react.dev/)
- [Flask](https://flask.palletsprojects.com/)
- [Ollama](https://ollama.ai/docs)
- [Qdrant](https://qdrant.tech/documentation/)
- [Prometheus](https://prometheus.io/docs/)
- [Grafana](https://grafana.com/docs/)

### Communautés
- [r/selfhosted](https://reddit.com/r/selfhosted)
- [Ollama Discord](https://discord.gg/ollama)
- [LangChain GitHub](https://github.com/langchain-ai/langchain)

---

*Tech Stack v1.0 - Février 2026*
