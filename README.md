# 🌊 OceanP RAG Platform 2026

> **Plateforme d'IA souveraine professionnelle**  
> *De la vision produit au code production. En solo.*

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Stack](https://img.shields.io/badge/19_microservices-Docker-2496ED?logo=docker)](TECH-STACK.md)
[![AI](https://img.shields.io/badge/LLM-Ollama_+_RAG-orange)](ARCHITECTURE-OVERVIEW.md)

---

## 🎯 En 30 secondes

**Problème :** Les entreprises ont des montagnes de données non exploitées.  
**Solution :** IA conversationnelle qui comprend VOS documents (pas ChatGPT générique).  
**Impact :** **630K€/an de gains** pour 15K€ d'infrastructure.

```mermaid
graph LR
    A[📄 Vos Documents] --> B[🔍 RAG Pipeline]
    B --> C[🤖 LLM Local]
    C --> D[💬 Réponses Précises]
    
    style A fill:#e1f5ff
    style B fill:#fff3cd
    style C fill:#d4edda
    style D fill:#d1ecf1
```

**Différence clé :** Vos données restent chez vous. Zero OpenAI. Zero fuite.

---

## 🏗️ Architecture en 3 Couches

```mermaid
graph TB
    subgraph Frontend["🎨 PRÉSENTATION"]
        UI[React 19<br/>Dashboards]
    end
    
    subgraph Backend["⚙️ APPLICATION"]
        API[Flask APIs<br/>Mission Factory]
        N8N[n8n Workflows<br/>Automation]
    end
    
    subgraph AI["🤖 INTELLIGENCE"]
        LLM[Ollama<br/>Mistral • Llama 3.1]
        VDB[Qdrant<br/>Vector Search]
    end
    
    subgraph Data["💾 DONNÉES"]
        PG[(PostgreSQL<br/>+ pgvector)]
        MG[(MongoDB)]
        RD[(Redis)]
    end
    
    subgraph Ops["📊 OBSERVABILITÉ"]
        PROM[Prometheus]
        GRAF[Grafana]
        LOKI[Loki Logs]
    end
    
    UI --> API
    API --> LLM
    API --> VDB
    LLM --> VDB
    API --> PG
    API --> MG
    N8N --> API
    
    PROM -.monitoring.-> API
    PROM -.monitoring.-> LLM
    GRAF -.dashboard.-> PROM
    LOKI -.logs.-> API
    
    style Frontend fill:#e3f2fd
    style Backend fill:#fff3e0
    style AI fill:#e8f5e9
    style Data fill:#fce4ec
    style Ops fill:#f3e5f5
```

**19 microservices** orchestrés en **5 zones réseau isolées**.

---

## 🔄 Pipeline RAG en Action

```mermaid
sequenceDiagram
    participant U as 👤 Utilisateur
    participant F as 🎨 Frontend
    participant A as ⚙️ API
    participant V as 🔍 Qdrant
    participant L as 🤖 Ollama
    
    Note over U,L: 📥 Phase 1: Ingestion Documents
    U->>F: Upload PDF
    F->>A: POST /documents
    A->>A: Extract text (600 pages)
    A->>A: Split chunks (500 tokens)
    A->>L: Embed chunks
    L-->>A: Vectors (384 dim)
    A->>V: Store vectors + metadata
    V-->>A: ✅ Indexed
    A-->>F: Document prêt
    
    Note over U,L: 💬 Phase 2: Question/Réponse
    U->>F: "Résume les risques du projet X"
    F->>A: POST /chat
    A->>L: Embed question
    L-->>A: Query vector
    A->>V: Similarity search (top-5)
    V-->>A: Chunks pertinents
    A->>A: Build context
    A->>L: Generate (context + question)
    L-->>A: Réponse complète
    A-->>F: Display answer
    F-->>U: 📝 Réponse en 2-3s
```

**Performances mesurées :**
- ⚡ Recherche vectorielle : **<50ms**
- 🧠 Génération LLM : **1-3s** (CPU)
- 🎯 Précision retrieval : **85%+**

---

## 💰 ROI Business (6 Use Cases)

```mermaid
graph TD
    subgraph UC1[" "]
        A1[📰 Veille Stratégique<br/>500h/an économisées]
        A2[50K€/an]
    end
    
    subgraph UC2[" "]
        B1[📚 Knowledge Base<br/>1200h/an économisées]
        B2[120K€/an]
    end
    
    subgraph UC3[" "]
        C1[📝 Génération Docs<br/>800h/an économisées]
        C2[80K€/an]
    end
    
    subgraph UC4[" "]
        D1[🚨 Alerting Intelligent<br/>300h/an économisées]
        D2[150K€/an]
    end
    
    subgraph UC5[" "]
        E1[🎓 Onboarding<br/>200h/an économisées]
        E2[30K€/an]
    end
    
    subgraph UC6[" "]
        F1[😊 Sentiment Clients<br/>Churn -18%]
        F2[200K€/an]
    end
    
    A1 --> ROI[💎 ROI TOTAL<br/>630K€/an]
    B1 --> ROI
    C1 --> ROI
    D1 --> ROI
    E1 --> ROI
    F1 --> ROI
    
    ROI --> RATIO[Ratio 42:1<br/>15K€ investis]
    
    style UC1 fill:#e3f2fd
    style UC2 fill:#e8f5e9
    style UC3 fill:#fff3e0
    style UC4 fill:#fce4ec
    style UC5 fill:#f3e5f5
    style UC6 fill:#e0f2f1
    style ROI fill:#c8e6c9,stroke:#4caf50,stroke-width:3px
    style RATIO fill:#ffecb3,stroke:#ff9800,stroke-width:3px
```

**Détails :** Voir [USE-CASES.md](USE-CASES.md) pour les calculs complets.

---

## 🛠️ Stack Technique

```mermaid
mindmap
  root((OceanP<br/>Platform))
    Frontend
      React 19
      CoreUI 5
      Vite
      WebSockets
    Backend
      Python 3.11
      Flask
      Gunicorn
      n8n
    AI/ML
      Ollama
        Mistral 7B
        Llama 3.1
        Phi3
        Qwen
      Qdrant Vector DB
      RAG Pipeline
    Data
      PostgreSQL
        pgvector
      MongoDB
      Redis
    DevOps
      Docker Compose
      Caddy Proxy
      Makefile
    Observability
      Prometheus
      Grafana
      Loki
      cAdvisor
```

---

## 📊 Métriques Temps Réel

La plateforme collecte **18 métriques critiques** :

| Métrique | Objectif | Réel |
|----------|----------|------|
| 🚀 **Latence API** | <200ms | 120ms |
| 🤖 **Génération LLM** | <5s | 1-3s |
| 🔍 **Recherche vectorielle** | <100ms | <50ms |
| 💾 **Taille index** | - | 62GB |
| 📈 **Uptime** | >99% | 99.7% |
| 🔒 **Incidents sécu** | 0 | 0 |

**Dashboards Grafana** : 12 tableaux de bord métier + technique.

---

## 🔐 Sécurité by Design

```mermaid
graph LR
    subgraph Public["🌐 ZONE PUBLIQUE"]
        Caddy[Caddy Proxy<br/>TLS 1.3]
    end
    
    subgraph DMZ["🛡️ ZONE EDGE"]
        Frontend[React UI]
    end
    
    subgraph Internal["🔒 ZONE INTERNE"]
        API[APIs Flask]
    end
    
    subgraph Sensitive["🚫 ZONE SENSIBLE"]
        AI[LLM + Vector DB]
        DB[(Bases de données)]
    end
    
    Caddy -->|HTTPS only| Frontend
    Frontend -->|Auth JWT| API
    API -->|Internal net| AI
    API -->|Internal net| DB
    
    style Public fill:#ffebee
    style DMZ fill:#fff3e0
    style Internal fill:#e8f5e9
    style Sensitive fill:#e1f5fe
```

**Principes :**
- ✅ Segmentation réseau (5 zones Docker)
- ✅ Secrets management (pas de credentials hardcodés)
- ✅ TLS/HTTPS obligatoire
- ✅ RGPD compliant (données on-premise)
- ✅ Audit logs complets

**Détails :** [SECURITY.md](SECURITY.md)

---

## 🚀 Démarrage Rapide

```bash
# 1️⃣ Cloner (version complète sur demande)
git clone https://github.com/stepstev/rag-platform-2026-public

# 2️⃣ Infrastructure (exemple simplifié)
make install    # Pull images
make build      # Build services locaux  
make up         # Démarrer la stack

# 3️⃣ Accès
# Frontend:        http://localhost:3000
# Grafana:         http://localhost:3001
# API Docs:        http://localhost:8000/docs
```

**Prérequis :** Docker 24+, 16GB RAM, 100GB disque

---

## 👨‍💻 Auteur

**Stéphane CELTON**  
*Data Product Manager BI*  
*Assembleur • Concepteur • Développeur de solutions Open Source*

[![GitHub](https://img.shields.io/badge/GitHub-stepstev-181717?logo=github)](https://github.com/stepstev)

### 🏆 Réalisé en Solo

- 📐 Architecture N-tiers (5 couches)
- 🐳 19 microservices orchestrés
- ⚛️ Frontend React 19 + Backend Python 3.11
- 🤖 Pipeline RAG complet
- 📊 Stack observabilité production-grade
- 📖 18 000 mots de documentation

**De la vision au code. Du code à la valeur métier.**

> *"Un bon Data Product Manager comprend ce qu'il pilote.  
> Pas juste du reporting. Pas juste des roadmaps.  
> **Concevoir. Coder. Délivrer.**"*

---

## 📚 Documentation Complète

| 📄 Document | 🎯 Contenu | ⏱️ Lecture |
|------------|-----------|-----------|
| **[Architecture](ARCHITECTURE-OVERVIEW.md)** | N-tiers détaillé, sécurité réseau | 15 min |
| **[Use Cases](USE-CASES.md)** | 6 cas métier avec ROI détaillé | 12 min |
| **[Tech Stack](TECH-STACK.md)** | Choix techno + justifications | 10 min |
| **[Security](SECURITY.md)** | Sécurité, RGPD, conformité | 8 min |
| **[Vision](README-SHOWCASE.md)** | Philosophie & positionnement | 8 min |

---

## 📄 Licence

**MIT License** - Libre d'utilisation, même commerciale.  
Voir [LICENSE](LICENSE) pour les détails.

---

## 🤝 Contact

**Vous recrutez un Data Product Manager BI qui développe ?**  
**Vous voulez discuter d'architecture RAG ?**  
**Vous cherchez un expert IA on-premise & solutions Open Source ?**

📧 Voir mon profil GitHub pour me contacter

---

*Dernière mise à jour : Février 2026*
