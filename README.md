# Dodada Design System

A production-grade **iOS Design System** built with **SwiftUI** and **Atomic Design**. Dodada delivers a token-driven, themeable component library for consistent UI across apps—from startups to enterprise.

---

## Table of Contents

- [Overview](#overview)
- [Philosophy: Atomic Design](#philosophy-atomic-design)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Architecture](#architecture)
- [Foundations](#foundations)
- [Tokens & Theming](#tokens--theming)
- [Component Catalog](#component-catalog)
- [Usage Examples](#usage-examples)
- [Custom Themes](#custom-themes)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

**Dodada** is a Swift Package that provides:

- **Design tokens** for color, typography, spacing, radius, sizing, elevation, and layout
- **Theme protocol** (`DDDTheme`) so you can ship multiple themes (light/dark, brands) without forking components
- **Atomic layers**: Foundations → Atoms → Molecules → Organisms, with clear ownership and reuse
- **SwiftUI-native** APIs: `@Environment(\.colorTheme)`, modifiers like `.textStyles(_:)`, and token-based component props
- **iOS 16+** and **Swift 5.9** as the baseline

Components are built on tokens and the active theme, so changing the theme updates colors and typography app-wide without touching individual views.

---

## Philosophy: Atomic Design

Dodada follows **Atomic Design** (Brad Frost): UI is broken into a hierarchy of reusable pieces, from the smallest building blocks to full sections.

| Layer        | Role | Examples |
|-------------|------|----------|
| **Foundations** | Tokens and primitives (no UI) | `DodadaColorToken`, `DodadaTypographyToken`, `DodadaSpacingToken`, `DDDTheme` |
| **Atoms**       | Smallest UI units, single responsibility | `DDDButton`, `DDDIcon`, `DDDLabel`, `DDDAvatar`, `DDDInputContent`, `DDDTabItem` |
| **Molecules**   | Combinations of atoms | `DDDInputText`, `DDDInputDropDown`, `DDDTagView`, `DDDToast`, `DDDNotification`, `DDDCheckboxIcon` |
| **Organisms**   | Complex sections or patterns | `DDDGalleryView`, navigation rows, form sections |

Rules we follow:

- **Atoms** do not depend on other atoms; they consume tokens and `@Environment(\.colorTheme)`.
- **Molecules** compose atoms (and other molecules when needed) and expose a clear API.
- **Organisms** compose molecules and atoms to form recognizable sections (e.g. gallery, settings block).
- **Tokens** are the single source of truth; components never hardcode colors or spacing from the design system.

This keeps the system scalable, testable, and easy to onboard new engineers.

---

## Requirements

- **Xcode** 15+
- **iOS** 16.0+
- **Swift** 5.9+

---

## Installation

### Swift Package Manager

1. In Xcode: **File → Add Package Dependencies**
2. Enter the repository URL (or add a local path):
   ```
   https://github.com/your-org/ios-Dodada
   ```
3. Add the **Dodada** library to your app target.

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-org/ios-Dodada", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: ["Dodada"]
    )
]
```

### Dependencies

Dodada uses:

- [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI) for async image loading
- [SDWebImageSVGCoder](https://github.com/SDWebImage/SDWebImageSVGCoder) for SVG support

They are declared in the package; you do not need to add them to your app.

---

## Quick Start

1. **Register fonts** (required for typography tokens):

   ```swift
   @main
   struct MyApp: App {
       init() {
           Dodada.registerFonts()
       }
       var body: some Scene {
           WindowGroup {
               ContentView()
           }
       }
   }
   ```

2. **Install the design system** (optional but recommended) so the theme is available everywhere:

   ```swift
   WindowGroup {
       ContentView()
           .modifier(DDDDesignSystem.installGlobally())
   }
   ```

   Or set the theme manually at the root:

   ```swift
   ContentView()
       .environment(\.colorTheme, DDDThemeManager.shared.main)
   ```

3. **Use components and tokens**:

   ```swift
   VStack(spacing: .spacingMd) {
       Text("Welcome")
           .textStyles(.title2Bold)
           .foregroundStyle(Color.primaryValue500)

       DDDButton("Continue", desing: .primary) {
           // action
       }
   }
   .padding(.horizontal, .spacingMd)
   ```

---

## Architecture

### High-level flow

```
Design tokens (Figma / codegen)
        ↓
Foundations (DodadaColorToken, DodadaTypographyToken, spacing, radius, …)
        ↓
DDDTheme (colors, typography, foundation, components)
        ↓
Environment: .colorTheme
        ↓
Atoms → Molecules → Organisms (SwiftUI views)
```

- **Tokens** define *what* (e.g. `primaryValue500`, `calloutRegular`).
- **Theme** maps tokens to concrete values (e.g. hex, font) and can be swapped (default, dark, white-label).
- **Components** read the theme from the environment and resolve tokens via theme (e.g. `token.toColor(using: theme)`).

### Naming conventions

- **Dodada** = design system / token namespace (e.g. `DodadaColorToken`, `DodadaInputTokens`).
- **DDD** = delivery layer (SwiftUI views and theme types): `DDDButton`, `DDDTheme`, `DDDInputText`, `DDDIcon`.

---

## Foundations

Foundations are the smallest, non-UI building blocks. They are used by atoms and molecules and can be code-generated from design tools.

| Category   | Type / Enum | Purpose |
|-----------|-------------|---------|
| **Color** | `DodadaColorToken` | Semantic colors (primary, secondary, success, error, surfaces, borders, etc.) |
| **Typography** | `DodadaTypographyToken` | Font styles (e.g. `title1Bold`, `calloutRegular`, `caption2Regular`) |
| **Spacing** | `DodadaSpacingToken` | Padding and gaps (e.g. `spacingXs`, `spacingMd`) |
| **Radius** | `DodadaRadiusToken` | Corner radius (e.g. `radiusXs`, `radiusMd`) |
| **Sizing** | `DodadaSizingToken` | Heights, widths (e.g. `inputHeightLg`, icon sizes) |
| **Layout** | `DodadaLayoutToken` | Layout-related values |
| **Elevation** | `DodadaElevation` | Shadows / elevation levels |
| **Icons** | `DodadaIconToken` | Icon set identifiers (e.g. `userLock`, `actionsAdd`) |

### Color usage

- **From theme (recommended in views):**  
  `@Environment(\.colorTheme) var theme` then `DodadaColorToken.primaryValue500.toColor(using: theme)`.
- **Static shorthand (uses default theme):**  
  `Color.primaryValue500` or `Color.secondaryValue400`.

### Typography usage

- **Modifier (uses environment theme):**  
  `Text("Hello").textStyles(.calloutBold)`  
  Resolves font from `theme.typography.font(for: token)`.
- **Line height / spacing** use `DodadaLineHeight` and layout tokens where applicable.

### Spacing and layout

- Use token extensions on `CGFloat` or view modifiers where available, e.g. `.padding(.horizontal, .spacingMd)`.
- Constants like `.spacingSm`, `.spacingMd` come from the spacing foundation.

---

## Tokens & Theming

### Theme protocol

`DDDTheme` is the contract for a theme. It provides:

- **colors** – `DodadaTokenColorTokens` (semantic color palette)
- **typography** – `DodadaThemeTypographyTokens` (font for each typography token)
- **foundation** – spacing, radius, elevation, sizing, layout
- **components** – button, navigation bar, tab bar themes
- **Legacy** – `defaultButton`, `hoverButton`, `disabledButton`, etc., for older components

Default implementation: **`DDDThemeDefault`** (Quicksand, semantic colors from assets/tokens).

### Environment

- **Key:** `\.colorTheme`  
- **Default value:** `DDDThemeDefault()` (stable for Previews and tests).  
- **App override:** Set at root with `DDDThemeManager.shared.main` or a custom type:

  ```swift
  .environment(\.colorTheme, DDDThemeManager.shared.main)
  // or
  .environment(\.colorTheme, MyBrandTheme())
  ```

### Component-level tokens

Some components have their own token structs for state (default, focus, error, disabled), e.g.:

- **Input:** `DodadaInputTokens` with `defaultState`, `focusState`, `errorState`, `disabledState`, resolved by `DodadaInputTokens.tokens(isEnabled:isFocused:message:)`.
- **Button:** `DodadaButtonThemeTokens` (and design-specific tokens) for primary, secondary, ghost, etc.

These stay consistent with the global theme by resolving colors through `theme.colors` or `token.toColor(using: theme)`.

---

## Component Catalog

### Atoms

| Component | Description |
|-----------|-------------|
| **DDDButton** | Primary, secondary, ghost, link, etc.; supports leading/trailing icons and token-based theming. |
| **DDDIcon** | Icon from `DodadaIconToken`; respects `colorTheme` and optional color token. |
| **DDDLabel** | Label with optional leading/trailing content; typography via token. |
| **DDDAvatar** | User avatar (image or placeholder). |
| **DDDInputContent** | Input container (border, background, label, message) driven by `DodadaInputTokens` and theme. |
| **DDDTabItem** | Single tab item with label and optional indicator. |
| **DDDFieldWrapper** | Wraps a field with label and message (e.g. for forms). |

### Molecules

| Component | Description |
|-----------|-------------|
| **DDDInputText** | Text field with optional prefix/suffix, secure entry, validation message, and token-based styling. |
| **DDDInputDropDown** | Dropdown built from a list of options. |
| **DDDInputSearchable** | Searchable dropdown. |
| **DDDInputSearch** | Search field. |
| **DDDInputDatePicker** | Date picker input. |
| **DDDPhoneNumberView** | Phone input with country picker. |
| **DDDTagView** | Tag/chip with optional invert style. |
| **DDDBadge** | Badge with icon and style. |
| **DDDChipButton** | Chip-style button. |
| **DDDCheckboxIcon** / **DDDCheckboxText** / **DDDCheckboxFilter** | Checkbox variants. |
| **DDDToast** | Toast notification. |
| **DDDNotification** | Inline notification. |
| **DDDSection** | Section container (title + content). |
| **DDDPageIndicator** | Page dots. |
| **DDDTabBar** | Tab bar (e.g. with `DDDTabItem`). |
| **DDDRating** / **DDDRatingView** | Rating display. |
| **DDDMarker** / **DDDMarkerRestaurant** | Map/list markers. |
| **DDDSubSections** | Divider with optional icon. |
| **DDDMediaCard** / **DDDRestaurantPreview** | Card-style content. |
| **DDDPriceIndicatorView** / **DDDPricingView** | Price display. |
| **DDDListTagView** / **DDDChipContainerView** | Tag lists and chip containers. |
| **DDDSwipeableActionButton** | Row with swipe actions. |
| **DDDAsyncImage** | Async image (e.g. with SDWebImage). |

### Organisms

| Component | Description |
|-----------|-------------|
| **DDDGalleryView** | Gallery/organism-level view combining multiple components. |

---

## Usage Examples

### Button with icon

```swift
DDDButton("Save", desing: .primary, icon: .actionsCheck) {
    save()
}
```

### Themed text and spacing

```swift
VStack(alignment: .leading, spacing: .spacingSm) {
    Text("Title")
        .textStyles(.title2Bold)
        .foregroundStyle(Color.primaryValue500)
    Text("Subtitle")
        .textStyles(.calloutRegular)
        .foregroundStyle(Color.secondaryValue500)
}
.padding(.spacingMd)
```

### Input with validation

```swift
DDDInputText(
    "Email",
    value: $email,
    prompt: "you@example.com",
    message: .error("Invalid email"),
    isRequired: true,
    requiredMessage: "Email is required"
)
```

### Custom theme in environment

```swift
ContentView()
    .environment(\.colorTheme, DDDThemeAlternate())  // e.g. different typography
```

---

## Custom Themes

1. **Create a type** that conforms to `DDDTheme` (and any sub-protocols it uses).
2. **Provide** `colors`, `typography`, `foundation`, `components`, and legacy properties.
3. **Inject** at the root (or a subtree) with `.environment(\.colorTheme, YourTheme())`.

Example skeleton:

```swift
public struct MyBrandTheme: DDDTheme {
    public var name: String { "MyBrand" }
    public var colors: DodadaTokenColorTokens { MyBrandColors() }
    public var typography: DodadaThemeTypographyTokens { MyBrandTypography() }
    public var foundation: DDDFoundationTokens { FoundationDefault() }
    public var components: DodadaComponentTheme { ComponentThemeDefault() }
    public var defaultButton: Color { ... }
    public var disabledTextButton: Color { ... }
    public var borderRoundButton: CGFloat { 8 }
    public var disabledButton: Color { ... }
    public var hoverButton: Color { ... }
}
```

Using a different font family or palette in these types will automatically drive all token-based components.

---

## Project Structure

```
Sources/Dodada/
├── Dodada.swift                    # Font registration and entry point
├── Delivery/
│   ├── DDDSX.swift                 # Design system installer modifier
│   ├── Foundations/                # Tokens and primitives
│   │   ├── Color/
│   │   ├── Typography/
│   │   ├── Spacing/
│   │   ├── Radius/
│   │   ├── Sizing/
│   │   ├── Layout/
│   │   ├── LineHeight/
│   │   ├── Elevation/
│   │   ├── Icons/
│   │   ├── Theme/
│   │   └── Component/
│   ├── Atoms/                      # Buttons, icons, labels, input shell, tab item, avatar
│   ├── Molecules/                  # Inputs, tags, toasts, checkboxes, etc.
│   └── Organism/                   # Gallery and composite screens
├── Extensions/                     # View, Environment, etc.
└── Resources/
    ├── Fonts/
    └── Assets/
```

- **Foundations** = no SwiftUI views (only types and extensions for tokens and theme).
- **Atoms** = single-purpose views; **Molecules** = composed views; **Organisms** = full sections or flows.
- **Auto-generated** token files (e.g. from design) are called out in comments; custom logic lives in extensions (e.g. `DodadaInputTokens+Resolver`).

---

## Contributing

- **New components:** Prefer the correct atomic layer (atom vs molecule vs organism) and token-based APIs.
- **Tokens:** Prefer adding or extending design tokens rather than hardcoding values in components.
- **Theming:** Ensure new components read from `@Environment(\.colorTheme)` and resolve colors/typography via the theme.
- **Docs:** Add SwiftDoc and, when relevant, a short note in this README or in a component catalog.
- **Previews:** Use the default theme (no singleton in previews) and `Dodada.registerFonts()` in `onAppear` where typography is used.

---

## License

[Specify your license, e.g. MIT, proprietary.]

---

**Dodada** — Design once, deliver everywhere.
