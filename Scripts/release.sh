#!/bin/bash

# Script para hacer push, crear tag y release en GitHub
# Uso: ./Scripts/release.sh <tag_version>
# Ejemplo: ./Scripts/release.sh 0.1.0

set -e  # Salir si hay algún error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar que se proporcionó el tag
if [ -z "$1" ]; then
    echo -e "${RED}Error: Debes proporcionar un tag${NC}"
    echo "Uso: ./Scripts/release.sh <tag_version>"
    echo "Ejemplo: ./Scripts/release.sh 0.1.0"
    exit 1
fi

TAG=$1
REPO_URL=$(git config --get remote.origin.url)
REPO_NAME=$(basename -s .git "$REPO_URL")

echo -e "${GREEN}🚀 Iniciando proceso de release para tag: $TAG${NC}"

# Verificar si hay cambios sin commitear
if ! git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}⚠️  Hay cambios sin commitear.${NC}"
    read -p "¿Deseas hacer commit de estos cambios? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Mensaje de commit: " COMMIT_MSG
        git add -A
        git commit -m "$COMMIT_MSG"
    else
        echo -e "${RED}❌ Abortado. Haz commit de tus cambios primero.${NC}"
        exit 1
    fi
fi

# Verificar que estamos en la rama main
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}⚠️  Estás en la rama: $CURRENT_BRANCH${NC}"
    read -p "¿Deseas continuar de todas formas? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}❌ Abortado.${NC}"
        exit 1
    fi
fi

# Push de la rama actual
echo -e "${GREEN}📤 Haciendo push de la rama $CURRENT_BRANCH...${NC}"
git push origin "$CURRENT_BRANCH" || {
    # Si falla, intentar configurar upstream
    git push --set-upstream origin "$CURRENT_BRANCH"
}

# Verificar si el tag ya existe
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  El tag $TAG ya existe localmente.${NC}"
    read -p "¿Deseas eliminarlo y recrearlo? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git tag -d "$TAG"
        if git ls-remote --tags origin | grep -q "refs/tags/$TAG"; then
            git push origin ":refs/tags/$TAG"
        fi
    else
        echo -e "${RED}❌ Abortado.${NC}"
        exit 1
    fi
fi

# Crear el tag
echo -e "${GREEN}🏷️  Creando tag $TAG...${NC}"
git tag "$TAG"

# Push del tag
echo -e "${GREEN}📤 Haciendo push del tag $TAG...${NC}"
git push origin "$TAG"

# Crear release en GitHub
echo -e "${GREEN}📦 Creando release en GitHub...${NC}"

# Verificar si gh CLI está instalado
if command -v gh &> /dev/null; then
    # Usar GitHub CLI
    echo "Usando GitHub CLI..."
    read -p "Título del release (presiona Enter para usar '$TAG'): " RELEASE_TITLE
    RELEASE_TITLE=${RELEASE_TITLE:-$TAG}
    
    read -p "Descripción del release (presiona Enter para dejar vacío): " RELEASE_BODY
    
    if [ -z "$RELEASE_BODY" ]; then
        gh release create "$TAG" --title "$RELEASE_TITLE"
    else
        gh release create "$TAG" --title "$RELEASE_TITLE" --notes "$RELEASE_BODY"
    fi
    
    echo -e "${GREEN}✅ Release creado exitosamente con GitHub CLI${NC}"
else
    # Intentar usar la API de GitHub directamente
    echo "GitHub CLI no está instalado. Intentando usar la API de GitHub..."
    
    # Verificar si hay un token de GitHub
    GITHUB_TOKEN=${GITHUB_TOKEN:-""}
    
    if [ -z "$GITHUB_TOKEN" ]; then
        echo -e "${YELLOW}⚠️  GITHUB_TOKEN no está configurado.${NC}"
        echo "Para crear el release, necesitas:"
        echo "1. Instalar GitHub CLI: brew install gh"
        echo "2. O configurar GITHUB_TOKEN como variable de entorno"
        echo ""
        echo "El tag $TAG fue creado y pusheado exitosamente."
        echo "Puedes crear el release manualmente en: https://github.com/junvegu/ios-dodada/releases/new"
        exit 0
    fi
    
    # Extraer owner y repo de la URL
    if [[ $REPO_URL == *"github.com"* ]]; then
        OWNER=$(echo "$REPO_URL" | sed -E 's/.*github\.com[:/]([^/]+)\/([^/]+)\.git/\1/')
        REPO=$(echo "$REPO_URL" | sed -E 's/.*github\.com[:/]([^/]+)\/([^/]+)\.git/\2/')
        
        read -p "Título del release (presiona Enter para usar '$TAG'): " RELEASE_TITLE
        RELEASE_TITLE=${RELEASE_TITLE:-$TAG}
        
        read -p "Descripción del release (presiona Enter para dejar vacío): " RELEASE_BODY
        
        # Crear release usando la API
        RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
            -H "Authorization: token $GITHUB_TOKEN" \
            -H "Accept: application/vnd.github.v3+json" \
            "https://api.github.com/repos/$OWNER/$REPO/releases" \
            -d "{\"tag_name\":\"$TAG\",\"name\":\"$RELEASE_TITLE\",\"body\":\"$RELEASE_BODY\"}")
        
        HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
        BODY=$(echo "$RESPONSE" | head -n-1)
        
        if [ "$HTTP_CODE" -eq 201 ]; then
            echo -e "${GREEN}✅ Release creado exitosamente con la API de GitHub${NC}"
        else
            echo -e "${RED}❌ Error al crear el release:${NC}"
            echo "$BODY"
            exit 1
        fi
    else
        echo -e "${YELLOW}⚠️  No se pudo determinar el repositorio de GitHub.${NC}"
        echo "El tag $TAG fue creado y pusheado exitosamente."
        echo "Puedes crear el release manualmente."
    fi
fi

echo -e "${GREEN}✅ Proceso completado exitosamente!${NC}"
echo -e "${GREEN}🎉 Tag $TAG creado, pusheado y release publicado${NC}"

