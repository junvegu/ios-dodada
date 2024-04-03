// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let arrowDown = ImageAsset(name: "arrow-down")
    internal static let arrowLeft = ImageAsset(name: "arrow-left")
    internal static let arrowRight = ImageAsset(name: "arrow-right")
    internal static let arrowUpRight = ImageAsset(name: "arrow-up-right")
    internal static let arrowUp = ImageAsset(name: "arrow-up")
    internal static let chevronDown = ImageAsset(name: "chevron-down")
    internal static let chevronLeft = ImageAsset(name: "chevron-left")
    internal static let chevronRight = ImageAsset(name: "chevron-right")
    internal static let chevronUp = ImageAsset(name: "chevron-up")
    internal static let grid = ImageAsset(name: "grid")
    internal static let maximize2 = ImageAsset(name: "maximize-2")
    internal static let minimize2 = ImageAsset(name: "minimize-2")
    internal static let add = ImageAsset(name: "add")
    internal static let alertCircle = ImageAsset(name: "alert-circle")
    internal static let alertTriangle = ImageAsset(name: "alert-triangle")
    internal static let chevronDownFill = ImageAsset(name: "chevron-down-fill")
    internal static let chevronUpFill = ImageAsset(name: "chevron-up-fill")
    internal static let circle = ImageAsset(name: "circle")
    internal static let clock = ImageAsset(name: "clock")
    internal static let collections = ImageAsset(name: "collections")
    internal static let delete = ImageAsset(name: "delete")
    internal static let download = ImageAsset(name: "download")
    internal static let externalLink = ImageAsset(name: "external-link")
    internal static let filter = ImageAsset(name: "filter")
    internal static let gift = ImageAsset(name: "gift")
    internal static let globe = ImageAsset(name: "globe")
    internal static let heart = ImageAsset(name: "heart")
    internal static let helpCircle = ImageAsset(name: "help-circle")
    internal static let home = ImageAsset(name: "home")
    internal static let info = ImageAsset(name: "info")
    internal static let lifeBuoy = ImageAsset(name: "life-buoy")
    internal static let mail = ImageAsset(name: "mail")
    internal static let mapPin = ImageAsset(name: "map-pin")
    internal static let map = ImageAsset(name: "map")
    internal static let restaurant = ImageAsset(name: "restaurant")
    internal static let share2 = ImageAsset(name: "share-2")
    internal static let slash = ImageAsset(name: "slash")
    internal static let trendingTopic = ImageAsset(name: "trending topic")
    internal static let trendingDown = ImageAsset(name: "trending-down")
    internal static let trendingUp = ImageAsset(name: "trending-up")
    internal static let zap = ImageAsset(name: "zap")
    internal static let award2 = ImageAsset(name: "award 2")
    internal static let award = ImageAsset(name: "award")
    internal static let calendar = ImageAsset(name: "calendar")
    internal static let check = ImageAsset(name: "check")
    internal static let dollarSign = ImageAsset(name: "dollar-sign")
    internal static let edit2 = ImageAsset(name: "edit-2")
    internal static let eyeOff = ImageAsset(name: "eye-off")
    internal static let eye = ImageAsset(name: "eye")
    internal static let image = ImageAsset(name: "image")
    internal static let like = ImageAsset(name: "like")
    internal static let list = ImageAsset(name: "list")
    internal static let loader = ImageAsset(name: "loader")
    internal static let lock = ImageAsset(name: "lock")
    internal static let menuFood = ImageAsset(name: "menu food")
    internal static let minus = ImageAsset(name: "minus")
    internal static let moreHorizontal = ImageAsset(name: "more-horizontal")
    internal static let moreVertical = ImageAsset(name: "more-vertical")
    internal static let navigation = ImageAsset(name: "navigation")
    internal static let phone = ImageAsset(name: "phone")
    internal static let plus = ImageAsset(name: "plus")
    internal static let premium = ImageAsset(name: "premium")
    internal static let promo = ImageAsset(name: "promo")
    internal static let refreshCcw = ImageAsset(name: "refresh-ccw")
    internal static let search = ImageAsset(name: "search")
    internal static let send = ImageAsset(name: "send")
    internal static let settings = ImageAsset(name: "settings")
    internal static let share = ImageAsset(name: "share")
    internal static let smile = ImageAsset(name: "smile")
    internal static let star = ImageAsset(name: "star")
    internal static let trash2 = ImageAsset(name: "trash-2")
    internal static let unlock = ImageAsset(name: "unlock")
    internal static let upload = ImageAsset(name: "upload")
    internal static let wifi = ImageAsset(name: "wifi")
    internal static let x = ImageAsset(name: "x")
    internal static let anticuchos = ImageAsset(name: "Anticuchos")
    internal static let chicken = ImageAsset(name: "Chicken")
    internal static let delivery = ImageAsset(name: "Delivery")
    internal static let privacy = ImageAsset(name: "Privacy")
    internal static let bell = ImageAsset(name: "bell")
    internal static let booking = ImageAsset(name: "booking")
    internal static let cafe = ImageAsset(name: "cafe")
    internal static let creditCard = ImageAsset(name: "credit card")
    internal static let eatInRestaurant = ImageAsset(name: "eat in restaurant")
    internal static let estacionamiento = ImageAsset(name: "estacionamiento")
    internal static let food = ImageAsset(name: "food")
    internal static let glow = ImageAsset(name: "glow")
    internal static let happyHour = ImageAsset(name: "happy hour")
    internal static let kidsPlay = ImageAsset(name: "kids play")
    internal static let music = ImageAsset(name: "music")
    internal static let payment = ImageAsset(name: "payment")
    internal static let terms = ImageAsset(name: "terms")
    internal static let terrace = ImageAsset(name: "terrace")
    internal static let apple = ImageAsset(name: "Apple")
    internal static let facebook = ImageAsset(name: "Facebook")
    internal static let google = ImageAsset(name: "Google")
    internal static let instagram = ImageAsset(name: "Instagram")
    internal static let twitter = ImageAsset(name: "Twitter")
    internal static let agend = ImageAsset(name: "agend")
    internal static let aquisito = ImageAsset(name: "aquisito")
    internal static let fotocheck = ImageAsset(name: "fotocheck")
    internal static let user = ImageAsset(name: "user")
  }
  internal enum Colors {
    internal static let black = ColorAsset(name: "Black")
    internal static let error = ColorAsset(name: "Error")
    internal static let info = ColorAsset(name: "Info")
    internal static let primary100 = ColorAsset(name: "Primary.100")
    internal static let primary200 = ColorAsset(name: "Primary.200")
    internal static let primary300 = ColorAsset(name: "Primary.300")
    internal static let primary400 = ColorAsset(name: "Primary.400")
    internal static let primary600 = ColorAsset(name: "Primary.600")
    internal static let primary700 = ColorAsset(name: "Primary.700")
    internal static let primary800 = ColorAsset(name: "Primary.800")
    internal static let primary900 = ColorAsset(name: "Primary.900")
    internal static let primary = ColorAsset(name: "Primary")
    internal static let secondary100 = ColorAsset(name: "Secondary.100")
    internal static let secondary200 = ColorAsset(name: "Secondary.200")
    internal static let secondary300 = ColorAsset(name: "Secondary.300")
    internal static let secondary400 = ColorAsset(name: "Secondary.400")
    internal static let secondary600 = ColorAsset(name: "Secondary.600")
    internal static let secondary700 = ColorAsset(name: "Secondary.700")
    internal static let secondary800 = ColorAsset(name: "Secondary.800")
    internal static let secondary900 = ColorAsset(name: "Secondary.900")
    internal static let secondary = ColorAsset(name: "Secondary")
    internal static let success = ColorAsset(name: "Success")
    internal static let warning = ColorAsset(name: "Warning")
    internal static let white = ColorAsset(name: "White")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  public init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
