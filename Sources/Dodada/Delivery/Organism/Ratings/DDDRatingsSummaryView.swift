import SwiftUI

public struct DDDRatingCategoryItem: Identifiable {
    public let id = UUID()
    public let title: String
    public let score: String
    
    public init(title: String, score: String) {
        self.title = title
        self.score = score
    }
}

public struct DDDRatingsSummaryView: View {
    @Environment(\.colorTheme) private var theme: DDDTheme
    
    public let averageScore: String
    public let ratingsCount: Int
    public let categories: [DDDRatingCategoryItem]
    public let distributionScores: [Double]?
    
    public let outOfFiveLabel: String
    public let basedOnFormat: String
    public let distributionLabels: [String]
    
    public init(
        averageScore: String,
        ratingsCount: Int,
        categories: [DDDRatingCategoryItem],
        distributionScores: [Double]? = nil,
        outOfFiveLabel: String = "/5",
        basedOnFormat: String = "Basado en %d calificaciones verificadas",
        distributionLabels: [String] = ["Muy bueno", "Bueno", "Intermedio", "Malo", "Muy malo"]
    ) {
        self.averageScore = averageScore
        self.ratingsCount = ratingsCount
        self.categories = categories
        self.distributionScores = distributionScores
        self.outOfFiveLabel = outOfFiveLabel
        self.basedOnFormat = basedOnFormat
        self.distributionLabels = distributionLabels
    }
    
    public var body: some View {
        let avgDouble = Double(averageScore) ?? 0.0
        
        VStack(alignment: .leading, spacing: .spacingXl) {
            HStack(alignment: .top, spacing: .spacingXl) {
                
                VStack(alignment: .leading, spacing: .spacingTwoXs) {
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text(String(format: "%.1f", avgDouble))
                            .textStyle(.largeTitleBold)
                            .foregroundColor(Color.secondaryValue500)
                        
                        Text(outOfFiveLabel)
                            .textStyle(.bodyBold)
                            .foregroundColor(Color.secondaryValue500)
                    }
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            let fillAmount = min(max(avgDouble - Double(index), 0.0), 1.0)
                            
                            ZStack(alignment: .leading) {
                                DDDIcon(.contentStar, color: nil, size: .iconXs)
                                    .iconColor(.secondaryValue200)
                                
                                DDDIcon(.contentStar, color: nil, size: .iconXs)
                                    .iconColor(.warningValue300)
                                    .mask(
                                        GeometryReader { geometry in
                                            Rectangle()
                                                .frame(width: geometry.size.width * CGFloat(fillAmount))
                                        }
                                    )
                            }
                        }
                    }
                    .padding(.bottom, .spacingTwoXs)
                    
                    Text(String(format: basedOnFormat, ratingsCount))
                        .textStyle(.caption2Regular)
                        .foregroundColor(Color.secondaryValue400)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let distribution = distributionScores, distribution.count == 5, distributionLabels.count == 5 {
                    VStack(spacing: .spacingXs) {
                        distributionBar(label: distributionLabels[0], percentage: distribution[0], color: .successValue500)
                        distributionBar(label: distributionLabels[1], percentage: distribution[1], color: .successValue400)
                        distributionBar(label: distributionLabels[2], percentage: distribution[2], color: .warningValue500)
                        distributionBar(label: distributionLabels[3], percentage: distribution[3], color: .secondaryValue300)
                        distributionBar(label: distributionLabels[4], percentage: distribution[4], color: .secondaryValue200)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            Divider()
                .background(Color.secondaryValue200)
                .padding(.vertical, .spacingXs)
            
            HStack(spacing: 0) {
                ForEach(Array(categories.enumerated()), id: \.offset) { index, category in
                    categoryView(title: category.title, score: category.score)
                    
                    if index < categories.count - 1 {
                        Spacer()
                    }
                }
            }
        }
        .padding(.spacingMd)
    }
    
    @ViewBuilder
    private func distributionBar(label: String, percentage: Double, color: DodadaColorToken) -> some View {
        HStack(spacing: .spacingSm) {
            Text(label)
                .textStyle(.caption1Regular)
                .foregroundColor(Color.secondaryValue500)
                .frame(width: 80, alignment: .leading)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.secondaryValue200)
                    
                    Capsule()
                        .fill(color.toColor(using: theme) ?? Color.green)
                        .frame(width: geometry.size.width * CGFloat(min(max(percentage, 0), 1)))
                }
            }
            .frame(height: 8)
        }
    }
    
    @ViewBuilder
    private func categoryView(title: String, score: String) -> some View {
        let scoreDouble = Double(score) ?? 0.0
        
        VStack(spacing: .spacingTwoXs) {
            Text(title)
                .textStyle(.caption1Regular)
                .foregroundColor(.secondaryValue500)
            
            Text(String(format: "%.1f", scoreDouble))
                .textStyle(.caption1Bold)
                .foregroundColor(.secondaryValue400)
        }
    }
}

#if Preview || DEBUG
struct DDDRatingsSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            DDDRatingsSummaryView(
                averageScore: "4.1",
                ratingsCount: 795,
                categories: [
                    DDDRatingCategoryItem(title: "Comida", score: "4.0"),
                    DDDRatingCategoryItem(title: "Servicio", score: "4.0"),
                    DDDRatingCategoryItem(title: "Ambiente", score: "4.0"),
                    DDDRatingCategoryItem(title: "Precio", score: "4.0")
                ],
                distributionScores: [0.8, 0.6, 0.1, 0.0, 0.0]
            )
            .previewDisplayName("Diseño Completo")
            
            DDDRatingsSummaryView(
                averageScore: "4.33",
                ratingsCount: 3,
                categories: [
                    DDDRatingCategoryItem(title: "Food", score: "2.67"),
                    DDDRatingCategoryItem(title: "Service", score: "3.33"),
                    DDDRatingCategoryItem(title: "Ambience", score: "2.67"),
                    DDDRatingCategoryItem(title: "Price", score: "4.67")
                ],
                distributionScores: nil,
                basedOnFormat: "Calculado de %d reseñas",
                distributionLabels: ["Very Good", "Good", "Average", "Poor", "Very Poor"]
            )
            .previewDisplayName("Personalizado y Sin Distribución")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
