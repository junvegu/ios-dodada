//
//  MenuPlaceHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/01/26.
//

import SwiftUI

public struct MenuPlaceHorizontalView<Item: Identifiable>: View {
    private let title: String
    private let menuItems: [Item]
    private let lastUpdated: String?
    private let menuName: (Item) -> String
    private let menuImageURL: (Item) -> String
    private let menuPageCount: (Item) -> Int
    private let menuURL: ((Item) -> URL?)?
    private let onItemTap: ((Item) -> Void)?
    
    public init(
        title: String = "Menú",
        menuItems: [Item],
        lastUpdated: String? = nil,
        menuName: @escaping (Item) -> String,
        menuImageURL: @escaping (Item) -> String,
        menuPageCount: @escaping (Item) -> Int,
        menuURL: ((Item) -> URL?)? = nil,
        onItemTap: ((Item) -> Void)? = nil
    ) {
        self.title = title
        self.menuItems = menuItems
        self.lastUpdated = lastUpdated
        self.menuName = menuName
        self.menuImageURL = menuImageURL
        self.menuPageCount = menuPageCount
        self.menuURL = menuURL
        self.onItemTap = onItemTap
    }
    
    private enum Constants {
        static var cardSpacing: CGFloat { 16 }
        static var cardWidth: CGFloat { 130 }
        static var cardHeight: CGFloat { 170 }
    }
    
    public var body: some View {
        VStack(spacing: .spacingMd) {
            DDDSection(
                title: title,
                subtitle: lastUpdated,
                buttonTitle: nil
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(menuItems) { item in
                        MenuCardView(
                            name: menuName(item),
                            quantityItem: menuPageCount(item),
                            imageURL: menuImageURL(item),
                            onTap: {
                                onItemTap?(item)
                            }
                        )
                    }
                }
                .padding(.horizontal, .spacingMd)
            }
        }
    }
}

private struct MenuCardView: View {
    let name: String
    let quantityItem: Int
    let imageURL: String
    var onTap: (() -> Void)? = nil
    @State private var showWebView = false
    
    private enum Constants {
        static var cardWidth: CGFloat { 130 }
        static var cardHeight: CGFloat { 170 }
    }
    
    var body: some View {
        Button {
            if let onTap = onTap {
                onTap()
            }
        } label: {
            ZStack(alignment: .bottomLeading) {
                if !imageURL.isEmpty {
                    DDDAsyncImage(urlString: imageURL)
                        .scaledToFill()
                        .frame(width: Constants.cardWidth, height: Constants.cardHeight)
                        .clipped()
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.3),
                                    Color.black.opacity(0.8)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                } else {
                    // Placeholder cuando no hay imagen
                    RoundedRectangle(cornerRadius:.radiusXl)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: Constants.cardWidth, height: Constants.cardHeight)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.3),
                                    Color.black.opacity(0.8)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
                
                VStack(alignment: .leading, spacing: .spacingTwoXs) {
                    Text(name)
                        .textStyle(.caption1Bold)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:40 ,height: 1)
                    
                    Text("\(quantityItem) categorías")
                        .textStyle(.caption2Regular)
                        .foregroundColor(.white)
                    
                }
                .padding(.spacingSm)
                .frame(width: Constants.cardWidth, alignment: .leading)
            }
            .frame(width: Constants.cardWidth, height: Constants.cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: .radiusXl))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#if DEBUG
struct MenuPlaceHorizontalView_Previews: PreviewProvider {
    struct MockMenuItem: Identifiable {
        let id: Int
        let name: String
        let pageCount: Int
        let imageURL: String
        let url: URL?
    }
    
    static var previews: some View {
        Group {
            
            MenuPlaceHorizontalView(
                menuItems: [
                    MockMenuItem(
                        id: 1,
                        name: "Carta Principal",
                        pageCount: 3,
                        imageURL: "https://picsum.photos/seed/menu1/340/200",
                        url: URL(string: "https://example.com/menu")
                    ),
                    MockMenuItem(
                        id: 2,
                        name: "Carta de Bebidas",
                        pageCount: 2,
                        imageURL: "https://picsum.photos/seed/menu2/340/200",
                        url: URL(string: "https://example.com/drinks")
                    ),
                    MockMenuItem(
                        id: 3,
                        name: "Postres Especiales",
                        pageCount: 5,
                        imageURL: "https://picsum.photos/seed/menu3/340/200",
                        url: URL(string: "https://example.com/desserts")
                    )
                ],
                lastUpdated: "Actualizado hace 3 meses",
                menuName: { $0.name },
                menuImageURL: { $0.imageURL },
                menuPageCount: { $0.pageCount }
            )
            .previewDisplayName("Con imágenes")
            
            MenuPlaceHorizontalView(
                menuItems: [
                    MockMenuItem(
                        id: 1,
                        name: "Menú Diario",
                        pageCount: 1,
                        imageURL: "",
                        url: URL(string: "https://example.com/daily")
                    ),
                    MockMenuItem(
                        id: 2,
                        name: "Menú Especial",
                        pageCount: 4,
                        imageURL: "",
                        url: nil
                    )
                ],
                lastUpdated: nil,
                menuName: { $0.name },
                menuImageURL: { $0.imageURL },
                menuPageCount: { $0.pageCount }
            )
            .previewDisplayName("Sin imágenes")
        }
        .frame(height: 300)
    }
}
#endif

