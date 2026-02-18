#!/bin/bash
# ====================================================================
# Script de Vérification Pré-Publication - public-showcase/
# ====================================================================
# Vérifie qu'aucune donnée sensible n'est présente avant publication
# Usage: ./check-security.sh
# ====================================================================

set -e  # Exit on error

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SHOWCASE_DIR="/home/sc/Rag-Plateform-2026/public-showcase"
ISSUES_FOUND=0

echo "🔍 VÉRIFICATION SÉCURITÉ PRÉ-PUBLICATION"
echo "========================================"
echo ""

# Change to showcase directory
cd "$SHOWCASE_DIR"

# 1. Check for passwords/secrets
echo "1️⃣  Recherche de secrets/credentials..."
if grep -rni "password\|secret\|token\|api_key\|credential" . 2>/dev/null | grep -v "SECURITY.md\|_GUIDE\|PUBLICATION"; then
    echo -e "${RED}❌ ALERTE: Mots-clés sensibles trouvés !${NC}"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ Aucun secret détecté${NC}"
fi
echo ""

# 2. Check for real IP addresses (excluding documentation examples)
echo "2️⃣  Recherche d'adresses IP réelles..."
if grep -rE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' . 2>/dev/null | grep -v "172.20\|127.0.0.1\|0.0.0.0\|ARCHITECTURE\|TECH-STACK" | grep -v ".sh:"; then
    echo -e "${YELLOW}⚠️  Adresses IP trouvées (vérifier si exemples ou réelles)${NC}"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ Aucune IP réelle détectée${NC}"
fi
echo ""

# 3. Check for GitHub tokens
echo "3️⃣  Recherche de tokens GitHub..."
if grep -rni "ghp_\|github_token" . 2>/dev/null; then
    echo -e "${RED}❌ ALERTE: Token GitHub trouvé !${NC}"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ Aucun token GitHub${NC}"
fi
echo ""

# 4. Check for system paths
echo "4️⃣  Recherche de chemins système sensibles..."
if grep -rni "/home/sc\|/opt/Rag-Plateform" . 2>/dev/null | grep -v "PUBLICATION-GITHUB.md\|check-security.sh"; then
    echo -e "${YELLOW}⚠️  Chemins système trouvés (vérifier si nécessaires)${NC}"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ Pas de chemins système hardcodés${NC}"
fi
echo ""

# 5. Check for email addresses (except contact info)
echo "5️⃣  Recherche d'adresses email..."
EMAIL_COUNT=$(grep -rEoi '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' . 2>/dev/null | grep -v "INDEX.md\|SECURITY.md\|security@" | wc -l)
if [ "$EMAIL_COUNT" -gt 0 ]; then
    echo -e "${YELLOW}⚠️  $EMAIL_COUNT email(s) trouvée(s) - vérifier si intentionnel${NC}"
else
    echo -e "${GREEN}✅ Pas d'email inattendue${NC}"
fi
echo ""

# 6. Check for private notes/TODOs
echo "6️⃣  Recherche de notes privées..."
if grep -rni "TODO:\|FIXME:\|HACK:\|XXX:\|PRIVATE\|CONFIDENTIAL" . 2>/dev/null | grep -v "check-security.sh\|_GUIDE"; then
    echo -e "${YELLOW}⚠️  Notes internes trouvées${NC}"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ Pas de notes privées${NC}"
fi
echo ""

# 7. Check file sizes (warn if >1MB)
echo "7️⃣  Vérification tailles de fichiers..."
LARGE_FILES=$(find . -type f -size +1M 2>/dev/null)
if [ -n "$LARGE_FILES" ]; then
    echo -e "${YELLOW}⚠️  Fichiers volumineux détectés:${NC}"
    echo "$LARGE_FILES"
else
    echo -e "${GREEN}✅ Tous les fichiers < 1MB${NC}"
fi
echo ""

# 8. List all files to be published
echo "8️⃣  Fichiers qui seront publiés:"
echo "================================"
find . -type f ! -path "./.git/*" ! -name "check-security.sh" | sort
echo ""

# Summary
echo "========================================="
if [ $ISSUES_FOUND -eq 0 ]; then
    echo -e "${GREEN}✅ SÉCURITÉ OK - Prêt pour publication !${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Créer repository GitHub (voir PUBLICATION-GITHUB.md)"
    echo "  2. Copier contenu vers nouveau repo"
    echo "  3. git add . && git commit && git push"
    exit 0
else
    echo -e "${RED}❌ $ISSUES_FOUND problème(s) potentiel(s) détecté(s)${NC}"
    echo ""
    echo "Actions recommandées:"
    echo "  1. Examiner les alertes ci-dessus"
    echo "  2. Corriger si nécessaire"
    echo "  3. Re-lancer ce script"
    exit 1
fi
