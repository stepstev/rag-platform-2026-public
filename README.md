# 🌊 OceanP RAG Platform - Public Documentation

> **Plateforme d'IA souveraine professionnelle**  
> Architecture N-tiers • Pipeline RAG • Observabilité Production-Ready

[![License](https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue.svg)](LICENSE)
[![Documentation](https://img.shields.io/badge/docs-complete-green.svg)](INDEX.md)
[![Tech Stack](https://img.shields.io/badge/stack-React%20%7C%20Python%20%7C%20Ollama-orange.svg)](TECH-STACK.md)

---

## 📚 Documentation Complète

| Document | Description | Lecture |
|----------|-------------|---------|
| **[Vision & Philosophie](README-SHOWCASE.md)** | Introduction, objectifs, positionnement | 8 min |
| **[Architecture Overview](ARCHITECTURE-OVERVIEW.md)** | N-tiers, RAG pipeline, sécurité | 15 min |
| **[Use Cases](USE-CASES.md)** | 6 cas métier avec ROI (630K€/an) | 12 min |
| **[Tech Stack](TECH-STACK.md)** | Technologies & justifications | 10 min |
| **[Security](SECURITY.md)** | Sécurité by design + RGPD | 8 min |
| **[Index](INDEX.md)** | Navigation complète | 2 min |

---

## 🎯 Pourquoi ce Projet ?

Démontrer qu'un **Data Product Manager** peut :
- ✅ Concevoir une architecture N-tiers professionnelle
- ✅ Implémenter un pipeline RAG complet
- ✅ Déployer une observabilité production-grade
- ✅ Documenter comme un produit

**De la vision au code. Du code à la valeur métier.**

---

## 🏗️ Architecture Simplifiée

```
┌─────────────────────────────────────────────────────────┐
│  Frontend (React 19)  →  APIs (Flask)  →  LLM (Ollama) │
│         ↓                    ↓                  ↓       │
│   Dashboards         Observabilité      Vector DB       │
└─────────────────────────────────────────────────────────┘
```

**Stack :** React 19 • Python 3.11 • Ollama • Qdrant • PostgreSQL • Docker • Prometheus • Grafana

---

## 💼 Use Cases Démontrés

| Use Case | ROI/an | Temps gagné |
|----------|--------|-------------|
| **Veille stratégique automatisée** | 50K€ | 500h/an |
| **Knowledge base interne** | 120K€ | 1200h/an |
| **Génération automatisée de documents** | 80K€ | 800h/an |
| **Monitoring & alerting intelligent** | 150K€ | 300h/an |
| **Onboarding collaborateurs** | 30K€ | 200h/an |
| **Analyse sentiment clients** | 200K€ | Churn -18% |

**ROI Total :** 630K€/an | **Investissement :** 15K€/an | **Ratio :** 42:1

---

## 🔐 Note de Sécurité

Cette documentation est une **version publique simplifiée**.  
Les détails d'implémentation suivants ne sont **PAS** exposés :

- ❌ Configuration réseau détaillée
- ❌ Schémas d'adressage IP
- ❌ Code source complet
- ❌ Procédures opérationnelles sensibles
- ❌ Métriques production réelles

**Objectif :** Démontrer les capacités sans exposer l'avantage compétitif.

---

## 🚀 Points Forts Techniques

### Architecture
- ✅ **N-tiers** : 5 couches isolées (présentation, application, AI, data, ops)
- ✅ **Segmentation réseau** : 5 zones Docker (edge, internal, AI, data, ops)
- ✅ **Microservices** : 19 containers orchestrés
- ✅ **Scalabilité** : Ressources configurables par service

### Data Product Management
- ✅ **Vision produit** → architecture technique
- ✅ **Métriques KPIs** : latence, tokens, retrieval accuracy
- ✅ **Gouvernance** : traçabilité, audit logs, conformité
- ✅ **Documentation** : architecture as code

### DevOps / SRE
- ✅ **Observabilité** : Prometheus, Grafana, Loki
- ✅ **Automation** : n8n workflows, Makefile one-command
- ✅ **Monitoring** : SLIs/SLOs définis
- ✅ **Backup/Restore** : Stratégie disaster recovery

---

## 📊 Pipeline RAG

```
Document Upload → Text Extraction → Chunking → Embedding
       ↓                                              ↓
   Metadata                                    Vector Storage
                                                      ↓
User Query → Query Embedding → Semantic Search → Top-K Results
                                                      ↓
                              Context Assembly → LLM Generation
```

**Mesures collectées :**
- Temps d'embedding : ~200ms/chunk
- Latence recherche vectorielle : <50ms
- Génération LLM : 1-3s (Mistral 7B CPU)
- Précision retrieval : 85%+ (top-5)

---

## 📞 Contact

**Stéphane Tissot** - Data Product Manager  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/stephanetissot/)  
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/stepstev)

**Pour :**
- 💼 Opportunités professionnelles
- 🤝 Collaborations techniques
- 📧 Questions sur la plateforme

---

## 📄 Licence

Documentation sous licence **[Creative Commons BY-NC-SA 4.0](LICENSE)**.

Vous pouvez partager et réutiliser avec attribution, usage non-commercial.

---

## 🎓 Philosophie

> "Un bon Data Product Manager doit comprendre ce qu'il pilote.  
> Pas juste cadrer des roadmaps. Pas juste animer des comités.  
> **Concevoir. Coder. Délivrer.**"

Cette plateforme prouve qu'on peut :
- Structurer une vision produit claire
- L'architecturer professionnellement
- L'implémenter de bout en bout
- La documenter rigoureusement
- La monitorer comme en production

**Du concept au code. Du code à la valeur métier.**

---

*Dernière mise à jour : Février 2026*
