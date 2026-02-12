# Design Tokens – Architecture (iOS)

## A) Problemas del output anterior

1. **Tipado incorrecto**
   - `DodadaComponent` exponía todo como `CGFloat` vía `value`. Los tokens de tipografía de input (`inputTypographyLabel`, `inputTypographyOptional`, `inputTypographyPlaceholder`, `inputTypographyContentText`) son estilos de texto (`DodadaFont`), no dimensiones; el generador los mapeaba a `0`, lo cual es erróneo.

2. **Mezcla de responsabilidades**
   - Un único enum `DodadaComponent` agrupaba tokens de button, card, input, chip, avatar, modal, divider, listItem. Un solo tipo para todos los componentes impide un API clara por componente.

3. **Escalabilidad y duplicación**
   - Protocolo `DodadaComponentTokens` con decenas de propiedades estáticas y struct `DodadaThemeComponentTokens` con el mismo número de getters repetidos. Cualquier nuevo token implica tocar enum, protocolo y struct.

4. **Sin semántica por componente**
   - No existía la noción de “tokens de botón” o “tokens de input” con tamaño/variante; solo un flat list de casos.

---

## B) Estructura de archivos y namespaces

```
dist/ios/
├── Color/                    # Primitives: color
│   ├── DodadaColorToken.swift
│   └── Dodada+Color.swift
├── Spacing/                  # Primitives: spacing (CGFloat)
│   ├── DodadaSpacingToken.swift
│   └── Spacing+CGFloat.swift
├── Radius/                   # Primitives: radius (CGFloat)
│   ├── DodadaRadiusToken.swift
│   └── Radius+CGFloat.swift
├── Sizing/                   # Primitives: sizing (CGFloat)
│   ├── DodadaSizingToken.swift
│   └── Sizing+CGFloat.swift
├── Elevation/                # Primitives: elevation
│   └── DodadaElevation.swift
├── Typography/               # Primitives: typography (DodadaFont, no CGFloat)
│   ├── DodadaTypography.swift   # DodadaFont + DodadaTypographyToken
│   └── ...
├── Component/                # Semantics + deprecated shim + examples
│   ├── DodadaButtonSemanticTokens.swift   # DodadaButtonSize, DodadaButtonVariant, DodadaButtonSemanticTokens, DodadaButtonTokens
│   ├── DodadaInputSemanticTokens.swift    # DodadaInputSize, DodadaInputSemanticTokens, DodadaInputTokens (+ DodadaTypography = DodadaFont)
│   ├── DodadaCardSemanticTokens.swift     # DodadaCardSemanticTokens, DodadaCardTokens
│   ├── DodadaComponent.swift              # DEPRECATED: DodadaComponent enum + DodadaComponentTokens + DodadaThemeComponentTokens + inputTypographyFont(for:)
│   ├── DDDButtonTheme.swift               # Theme colors (SwiftUI Color) for button
│   ├── DDDComponentExamples.swift         # DDDButton, DDDTextField usage examples
│   └── TOKENS_ARCHITECTURE.md (this file)
└── ...
```

- **Primitives:** Spacing, Radius, Sizing, Elevation (enums/structs con `CGFloat`); Typography como `DodadaFont` (struct con family, size, weight, lineHeight, letterSpacing, underline). Ningún primitive se agrupa por “componente” en un solo enum.
- **Semantics:** Structs por componente que referencian primitives y exponen una API por tamaño/variante.
- **Components:** Helpers opcionales (ej. `DDDButton`, `DDDTextField`) que aplican semántica + tema; no mezclan implementación con primitives.

---

## C) Cambios realizados

- **Nuevos tipos**
  - `DodadaButtonSize` (.regular, .medium, .small), `DodadaButtonVariant` (primary, secondary, tertiary, link, onlyIconFilled, onlyIconOutline, onlyIconGhost).
  - `DodadaButtonSemanticTokens`: height, width?, paddingHorizontal, paddingVertical, radius, gap, minWidth? (referenciando `DodadaSizingToken`, `DodadaSpacingToken`, `DodadaRadiusToken`).
  - `DodadaInputSize` (.default, .sm, .md, .lg, .xl), `DodadaInputSemanticTokens`: height, paddingHorizontal, radius, gap + labelTypography, optionalTypography, placeholderTypography, contentTextTypography (`DodadaFont`).
  - `DodadaCardSemanticTokens` + `DodadaCardTokens.semantic(size:)`.
  - `typealias DodadaTypography = DodadaFont` para input.

- **API**
  - `DodadaButtonTokens.semantic(size:variant:) -> DodadaButtonSemanticTokens`
  - `DodadaInputTokens.semantic(size:) -> DodadaInputSemanticTokens`
  - `DodadaCardTokens.semantic(size:) -> DodadaCardSemanticTokens`

- **Deprecación**
  - `DodadaComponent`, `DodadaComponentTokens`, `DodadaThemeComponentTokens` marcados `@available(*, deprecated)` con mensaje que indica usar los semantic tokens por componente.
  - Input typography: en el enum se mantiene `value == 0` por compatibilidad, con TODO en código; se añade `DodadaComponent.inputTypographyFont(for:) -> DodadaFont?` para migración.

- **Tokens de tipografía de input**
  - Dejan de ser `CGFloat(0)` y se representan como `DodadaFont` vía `DodadaInputTokens.semantic(size:)` (label = footnoteBold, optional = footnoteRegular, placeholder = calloutRegular, contentText = caption2Regular).

---

## D) Ejemplos de uso

- **Botón (semántica):**
  ```swift
  let t = DodadaButtonTokens.semantic(size: .regular, variant: .primary)
  // t.height, t.paddingHorizontal, t.radius, t.gap, t.minWidth
  // Colores desde DDDButtonTheme (ej. DDDButtonThemeDefault())
  ```

- **Input (semántica):**
  ```swift
  let t = DodadaInputTokens.semantic(size: .default)
  // t.height, t.paddingHorizontal, t.radius, t.gap
  // t.labelTypography, t.placeholderTypography, t.contentTextTypography (DodadaFont)
  ```

- **Helpers de ejemplo:** `DDDComponentExamples.swift` incluye `DDDButton` (UIKit), `DDDButtonView` (SwiftUI), `DDDTextField` (UIKit), `DDDTextFieldView` (SwiftUI) usando los semantic tokens anteriores.

---

## E) Archivos creados/modificados

| Acción   | Ruta |
|----------|------|
| Crear    | `dist/ios/Component/DodadaButtonSemanticTokens.swift` |
| Crear    | `dist/ios/Component/DodadaInputSemanticTokens.swift` |
| Crear    | `dist/ios/Component/DodadaCardSemanticTokens.swift` |
| Crear    | `dist/ios/Component/DDDComponentExamples.swift` |
| Crear    | `dist/ios/TOKENS_ARCHITECTURE.md` |
| Modificar| `dist/ios/Component/DodadaComponent.swift` (deprecación, TODO para input typography, `inputTypographyFont(for:)`) |
