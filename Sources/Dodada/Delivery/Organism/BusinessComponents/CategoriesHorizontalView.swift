//
//  CategoriesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct CategoriesHorizontalView<Item: Identifiable>: View {
    private let categories: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onCategoryTap: (Item) -> Void
    private let categoryImageURL: (Item) -> URL?
    private let categoryName: (Item) -> String
    
    public init(
        categories: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onCategoryTap: @escaping (Item) -> Void,
        categoryImageURL: @escaping (Item) -> URL?,
        categoryName: @escaping (Item) -> String
    ) {
        self.categories = categories
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onCategoryTap = onCategoryTap
        self.categoryImageURL = categoryImageURL
        self.categoryName = categoryName
    }

    public var body: some View {
        VStack(spacing: .zero) {
            DDDSection(
                title: sectionTitle,
                subtitle: sectionSubtitle,
                buttonTitle: sectionButtonTitle,
                action: onSeeAllTap
            )
            .padding(.horizontal, .spacingMd)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: .spacingLg) {
                    ForEach(categories) { category in
                        CategoryView(
                            imageURL: categoryImageURL(category),
                            name: categoryName(category)
                        )
                        .onTapGesture {
                            onCategoryTap(category)
                        }
                    }
                    .padding(.top, .spacingTwoXs)
                    .padding(.bottom, .spacingSm)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, .spacingMd)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    // Mock data
    struct MockCategory: Identifiable {
        let id: String
        let imageURL: URL?
        let name: String
    }
    
    let mockCategories = [
        MockCategory(id: "1", imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"), name: "Anticuchería"),
        MockCategory(id: "2", imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"), name: "Brostería"),
        MockCategory(id: "3", imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"), name: "Hamburguesería"),
        MockCategory(id: "4", imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"), name: "Sanguchería")
    ]
    
    return ZStack {
        CategoriesHorizontalView(
            categories: mockCategories,
            sectionTitle: "Categorías",
            sectionSubtitle: nil,
            sectionButtonTitle: "Ver todos",
            onSeeAllTap: {},
            onCategoryTap: { _ in },
            categoryImageURL: { $0.imageURL },
            categoryName: { $0.name }
        )
    }
}

