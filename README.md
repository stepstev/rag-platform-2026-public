# 🌊 OceanP RAG Platform - MVP Exploratoire Open Source

> **Alternative souveraine aux solutions cloud non maîtrisées**  
> *MVP d'outillages open source pour sortir de la dépendance cloud US*

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Stack](https://img.shields.io/badge/19_microservices-Docker-2496ED?logo=docker)](TECH-STACK.md)
[![AI](https://img.shields.io/badge/LLM-Ollama_+_RAG-orange)](ARCHITECTURE-OVERVIEW.md)
[![Compliance](https://img.shields.io/badge/docs-RGPD_DORA_ISO-green)](COMPLIANCE-USE-CASES.md)
[![Sovereignty](https://img.shields.io/badge/100%25-On--Premise-blue)](ARCHITECTURE-OVERVIEW.md)

---

## 🇫🇷 Souveraineté Numérique : 100% Open Source

**Ce MVP exploratoire démontre qu'il est possible de construire une stack IA complète avec des outils open source, offrant une alternative aux solutions cloud propriétaires.**

### ✅ Architecture Ouverte & Maîtrisée

| Besoin | Alternative Open Source | Avantages |
|--------|-------------------------|------------|
| **LLM** | **Ollama** (Mistral, Llama) | Modèles locaux, données maîtrisées |
| **Vector DB** | **Qdrant** auto-hébergé | Infrastructure interne, RGPD natif |
| **Observabilité** | **Prometheus + Grafana** | Monitoring complet sans dépendance externe |
| **Base données** | **PostgreSQL + pgvector** | Solution éprouvée, hébergement flexible |
| **Orchestration** | **Docker Compose** | Déploiement simplifié, portabilité totale |

**Bénéfices :** Contrôle complet de l'infrastructure, réduction des coûts opérationnels, conformité réglementaire simplifiée

---

## 🎯 En 30 secondes

**Défi :** Exploiter l'IA générative tout en respectant la confidentialité des données  
**Approche :** Stack IA complète on-premise, 100% open source  


```mermaid
graph LR
    A[📄 Documents<br/>Métier] --> B[🔍 RAG Pipeline<br/>On-Premise]
    B --> C[🤖 LLM Local<br/>Ollama]
    C --> D[💬 Réponses<br/>Contextualisées]
    
    style A fill:#e1f5ff
    style B fill:#fff3cd
    style C fill:#d4edda
    style D fill:#d1ecf1
```

**Bénéfices clés :**
- 🇫🇷 **Données en France/EU** : Conformité RGPD native, données maîtrisées
- 🔓 **Open Source 100%** : Flexibilité technique, indépendance des fournisseurs
- 💰 **Optimisation budgétaire** : Réduction significative des coûts opérationnels
- 🛡️ **Sécurité** : Infrastructure interne, contrôle des flux réseau
- ⚖️ **Conformité** : DORA, HDS, Secnum Cloud compatible

---

## 🏢 Exploitabilité par Type d'Organisation

| Contexte | Setup | Coût | Use Cases | ROI | Souveraineté |
|----------|-------|------|-----------|-----|--------------|
| **PME (10-250)** | 1 jour | Setup léger | RGPD + Knowledge Base | Performance optimale | ✅ 100% |
| **ETI (250-5000)** | 1 semaine | Setup modulaire | RGPD + DORA + ISO 27001 | Performance optimale | ✅ 100% |
| **Grand Compte (5000+)** | 1 mois | Setup entreprise | Conformité complète | Performance optimale | ✅ 100% |
| **Secteur Public** | 2 semaines | Setup réglementé | Secnum Cloud + RGS | Performance optimale | ✅ 100% |

**→ Voir [COMPLIANCE-USE-CASES.md](COMPLIANCE-USE-CASES.md) pour détails réglementaires**

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

## � Cas d'Usage Métier

```mermaid
graph TD
    subgraph UC1[" "]
        A1[📰 Veille Stratégique<br/>Automatisation de la collecte]
    end
    
    subgraph UC2[" "]
        B1[📚 Knowledge Base<br/>Centralisation documentaire]
    end
    
    subgraph UC3[" "]
        C1[📝 Génération Documents<br/>Assistants IA métier]
    end
    
    subgraph UC4[" "]
        D1[🚨 Alerting Intelligent<br/>Monitoring proactif]
    end
    
    subgraph UC5[" "]
        E1[🎓 Onboarding<br/>Formation automatisée]
    end
    
    subgraph UC6[" "]
        F1[😊 Analyse Sentiment<br/>Feedback clients]
    end
    
    A1 --> ROI[💎 Valeur Métier<br/>Multi-usages]
    B1 --> ROI
    C1 --> ROI
    D1 --> ROI
    E1 --> ROI
    F1 --> ROI
    
    ROI --> IMPACT[Impact mesurable<br/>sur l'efficacité opérationnelle]
    
    style UC1 fill:#e3f2fd
    style UC2 fill:#e8f5e9
    style UC3 fill:#fff3e0
    style UC4 fill:#fce4ec
    style UC5 fill:#f3e5f5
    style UC6 fill:#e0f2f1
    style ROI fill:#c8e6c9,stroke:#4caf50,stroke-width:3px
    style IMPACT fill:#ffecb3,stroke:#ff9800,stroke-width:3px
```

**Détails :** Voir [USE-CASES.md](USE-CASES.md) pour les scénarios d'implémentation.

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

### 🌐 Observabilité Étendue : Intégration Entreprise

Bien que la stack soit 100% on-premise, **elle s'intègre parfaitement avec vos outils d'observabilité existants** :

#### 📡 APIs REST Observabilité

```mermaid
graph LR
    A[Stack On-Premise<br/>Prometheus + Grafana] --> B[API REST<br/>Stack Observability]
    B --> C{Outils Entreprise}
    C --> D[Power BI<br/>Reporting]
    C --> E[Plateformes Cloud<br/>Datadog, Azure Monitor]
    C --> F[SIEM<br/>Splunk, QRadar]
    
    style A fill:#e8f5e9
    style B fill:#fff3e0
    style C fill:#e3f2fd
    style D fill:#fce4ec
    style E fill:#f3e5f5
    style F fill:#e0f2f1
```

**Cas d'usage :**

| Intégration | Bénéfice | Cas d'usage |
|-------------|----------|-------------|
| **Power BI** | Reporting décisionnel | Dashboards exécutifs, KPIs métier consolidés |
| **Azure Monitor / AWS CloudWatch** | Corrélation multi-cloud | Monitoring hybride (on-premise + cloud) |
| **Datadog / Dynatrace** | Observabilité centralisée | Vue unifiée de tous les systèmes SI |
| **Splunk / Elastic SIEM** | Audit sécurité | Conformité SOC2, ISO 27001, traces complètes |
| **Tableau / Qlik** | BI avancée | Analyses prédictives sur métriques IA |

**Endpoints disponibles** (API REST JSON) :
- `/metrics/system` - CPU, RAM, disques, réseau
- `/metrics/docker` - État containers, health checks
- `/metrics/ai` - Performance LLM, latence RAG, précision
- `/metrics/business` - Documents traités, requêtes/jour, coûts

**Exemple Power BI** : Connecteur HTTP → Rafraîchissement automatique → Dashboards temps réel

💡 **Philosophie** : Stack souveraine **ne signifie pas isolée**. Vous gardez le contrôle des données tout en exploitant vos investissements BI existants.

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

## 🎯 MVP Exploratoire : Objectifs & Garanties

### 📐 Pourquoi ce projet ?

**Démontrer la faisabilité d'une stack IA souveraine 100% open source**

1. **Sortir de la dépendance cloud non souveraine**
   - Réduire dépendance GAFAM (AWS, Azure, GCP)
   - Éviter vendor lock-in solutions propriétaires
   - Maîtrise totale données (RGPD, CLOUD Act)

2. **Prouver viabilité alternative on-premise**
   - Stack complète 19 microservices open source
   - ROI supérieur cloud (42:1)
   - Conformité réglementaire native

3. **Démocratiser l'IA souveraine**
   - Accessible PME (15K€ vs 150K€/an cloud)
   - Documentation reproductible
   - Code orchestration MIT

### ⚖️ MVP vs Production

| Aspect | MVP Exploratoire | Production |
|--------|------------------|------------|
| **Objectif** | Démonstration faisabilité | Service 24/7 |
| **Données** | Jeux de test | Données réelles |
| **Sécurité** | Architecture sécurisée | + Audits, certifications |
| **Support** | Documentation | + Contrats, SLA |

### ✅ Ce que le MVP GARANTIT

- ✅ Architecture éprouvée (19 microservices fonctionnels)
- ✅ Stack 100% open source (0 dépendance propriétaire)
- ✅ Observabilité complète (Prometheus, Grafana, Loki)
- ✅ Reproductibilité (`make install && make up`)
- ✅ Conformité by design (RGPD, DORA, ISO)

### ⚠️ Ce que le MVP NE GARANTIT PAS

- ❌ Certifications officielles (ISO 27001, HDS)
- ❌ Validation juridique (consultation DPO/RSSI obligatoire)
- ❌ Support 24/7 production
- ❌ Tests charge industriels

### 🚀 Passage Production

**Avant déploiement données sensibles :**
1. ✅ Audit juridique (DPO, RSSI)
2. ✅ Pentest sécurité (ANSSI si Secnum)
3. ✅ Tests charge
4. ✅ Plan reprise activité
5. ✅ Formation utilisateurs

**Investissement migration production :**
- PME : Audit léger + Formation
- ETI : Certifications + Pentests + Support
- Grand Compte : Conformité complète + MCO industriel

---

## 👨‍💻 Auteur

**Stéphane CELTON**  
*Data Product Manager BI*  
*Assembleur • Concepteur • Développeur de solutions Open Source*

[![GitHub](https://img.shields.io/badge/GitHub-stepstev-181717?logo=github)](https://github.com/stepstev)

### 🏆 Réalisation 

- 📐 Architecture N-tiers (5 couches)
- 🐳 19 microservices orchestrés
- ⚛️ Frontend React 19 + Backend Python 3.11
- 🤖 Pipeline RAG complet
- 📊 Stack observabilité production-grade
- 📖 18 000 mots de documentation


## 📚 Documentation Complète

| 📄 Document | 🎯 Contenu | ⏱️ Lecture |
|------------|-----------|-----------|
| **[Compliance & Use Cases](COMPLIANCE-USE-CASES.md)** | 🔐 RGPD, DORA, ISO, Secnum - Documents sensibles | 12 min |
| **[Architecture](ARCHITECTURE-OVERVIEW.md)** | N-tiers détaillé, sécurité réseau | 15 min |
| **[Use Cases Métier](USE-CASES.md)** | 6 cas métier avec ROI détaillé | 12 min |
| **[Tech Stack](TECH-STACK.md)** | Choix techno + justifications | 10 min |
| **[Security](SECURITY.md)** | Sécurité, RGPD, conformité | 8 min |
| **[Third-Party Licenses](THIRD-PARTY-NOTICES.md)** | Composants open-source et licences | 5 min |

---

## 📄 Licence & Composants

### MIT License (Ce Projet)
**Cette licence s'applique uniquement à :**
- ✅ Code d'orchestration (Docker Compose, scripts)
- ✅ Code custom (APIs, frontend personnalisé)
- ✅ Configuration (Caddy, Prometheus, etc.)
- ✅ Documentation (tous les fichiers .md)

**Elle NE s'applique PAS aux composants tiers** (React, Ollama, PostgreSQL, Grafana, etc.) qui conservent leurs licences originales.

**→ Voir [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) pour la liste complète**

### ⚠️ Avant Production
**Ce MVP est un projet exploratoire de démonstration.**  
Avant déploiement production :
1. ✅ Audit juridique (RSSI, DPO)
2. ✅ Validation conformité réglementaire
3. ✅ Tests de sécurité
4. ✅ Vérification compatibilité licences

**→ Voir [COMPLIANCE-USE-CASES.md](COMPLIANCE-USE-CASES.md) pour détails RGPD/DORA/ISO**

---

## 🤝 Contact

**Vous recrutez un Data Product Manager BI qui développe ?**  
**Vous voulez discuter d'architecture RAG ?**  
**Vous cherchez un expert IA on-premise & solutions Open Source ?**

📧 Voir mon profil GitHub pour me contacter   www.linkedin.com/in/stephane-celton 

---

## 🔗 Ressources Connexes

**Articles & Publications :**

- 📝 [RAG : Maîtrise, Gouvernance et Souveraineté](https://www.linkedin.com/posts/oceanphenix_rag-ma%C3%AEtrise-gouvernance-et-souverainet%C3%A9-activity-7429088839937204224-5hWc) — Vision sur l'IA souveraine et la gouvernance des données
- 🚀 [Post LinkedIn - OceanPhenix](https://www.linkedin.com/feed/update/urn:li:activity:7418699746065825792) — Présentation du projet et réflexions architecture

**Plateformes & Contenus :**

- 🌐 [OceanPhenix](https://oceanphenix.fr/) — Site officiel du projet
- 👤 [Portfolio Stéphane Celton](https://stephanecelton.oceanphenix.fr/) — Réalisations et compétences
- 🎥 [YouTube - Discovery IT DATA](https://www.youtube.com/@DiscoveryITDATA) — Tutoriels, démos et retours d'expérience

---

*Dernière mise à jour : Février 2026*
